------------------------------------------------------------
-- ScrollFrame-1.0.lua
------------------------------------------------------------

-- Creates scroll frames for WOW addons. 

-- Abin
-- 2008-8-21

------------------------------------------------------------
-- Sample usage:
------------------------------------------------------------

-- local frame = UICreateScrollFrame(nil, MyOptionFrame);
-- frame:SetAllPoints(MyOptionFrame);
-- frame:SetScrollStep(20); -- Sets the scrolling step value(pixels per step).
-- frame:SetScrollChild(MyScrollContentsFrame);

-- Suppose the object "MyScrollContentsFrame" is where you put your contents on, you can create FontStrings,
-- Textures, Buttons or whatever objects and add on, if any of the contents is beyond the current region of "frame",
-- appropriate scroll bar(s) will appear on the right and/or bottom.

-- Please note that you can not set anchors for "MyScrollContentsFrame", also, since its a scroll frame's
-- scroll child, the right and bottom are unpredictable. Always use the "TOPLEFT" anchor to position your contents!

------------------------------------------------------------
-- API documentation:
--
-- The object returned by UICreateScrollFrame has all of the methods from UIObject, Region, Frame and ScrollFrame, plus the following: 
------------------------------------------------------------

-- UICreateScrollFrame(name, parent) -- Creates the scroll frame and its frame

-- frame:SetScrollStep(number) -- Specifies scrolling step value(pixels per step).
-- frame:GetScrollStep() -- Retrieves scrolling step value
-- frame:EnableVerticalBar() -- Enables the vertical scroll bar
-- frame:DisableVerticalBar() -- Disables the vertical scroll bar
-- frame:IsVerticalBarEnabled() -- Checks whether the vertical scroll bar is enabled
-- frame:EnableHorizontalBar() -- Enables the horizontal scroll bar
-- frame:DisableHorizontalBar() -- Disables the horizontal scroll bar
-- frame:IsHorizontalBarEnabled() -- Checks whether the horizontal scroll bar is enabled
-- frame:CheckVisible(left, top, right, bottom) -- Checks whether the given rect is in boundary of the scroll frame
-- frame:CheckRegionVisible(region) -- Checks whether the given region is in boundary of the scroll frame
-- frame:EnsureVisible(left, top, right, bottom, ignoreHorizontal, ignoreVertical) -- Ensures the given rect in boundary of the scroll frame, scroll if necessary
-- frame:EnsureRegionVisible(region, ignoreHorizontal, ignoreVertical) -- Ensures the given region in boundary of the scroll frame, scroll if necessary
-- frame:ScrollToTop() -- Scroll to top
-- frame:ScrollToBottom() -- Scroll to bottom
-- frame:ScrollToLeft() -- Scroll to left end
-- frame:ScrollToRight() -- Scroll to right end
------------------------------------------------------------

local MAJOR_VERSION = 1.0;
local MINOR_VERSION = 1.5;

-- To prevent older libraries from over-riding newer ones...
if type(UICreateScrollFrameIsNewerVersion) == "function" and not UICreateScrollFrameIsNewerVersion(MAJOR_VERSION, MINOR_VERSION) then return end

function UICreateScrollFrame(name, parent, template)
	
	local BARWIDTH = 18;

	-- Function to create vertical and horizontal scroll bars for the internal scroll frame
	-- A so called "ScrollBar" here is actually a frame that contains a Slider and two buttons on both ends.
	local function CreateScrollBar(parent, horizontal)		
		local BUTTONWIDTH = BARWIDTH * 0.6;

		local frame = CreateFrame("Frame", nil, parent);

		frame:Hide();
		frame:SetWidth(BARWIDTH);
		frame:SetHeight(BARWIDTH);
		frame:EnableMouseWheel(true); -- Mouse wheel support
		
		-- Creates a border to decorate the scroll bar
		local border = CreateFrame("Frame", nil, frame);
		border:SetBackdrop({ bgFile = "", tile = true, tileSize = 16, edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", edgeSize = 12, insets = {left = 0, right = 0, top = 0, bottom = 0 }, });
		border:SetBackdropBorderColor(0.75, 0.75, 0.75, 0.5);
		border:SetAllPoints(frame);
		border:SetScale(0.75); -- Just to make the border soft and fine

		-- This is the real Slider
		local bar = CreateFrame("Slider", nil, frame);
		frame._bar = bar;		

		bar:SetOrientation("VERTICAL");	
		if horizontal then
			bar:SetOrientation("HORIZONTAL");	
		end

		bar:SetMinMaxValues(0, 0);
		bar:SetValueStep(1);
		bar:SetValue(0);

		bar:SetWidth(BUTTONWIDTH);
		bar:SetHeight(BUTTONWIDTH);			
		
		-- The thumb nail texture
		local thumb = bar:CreateTexture(nil, "OVERLAY");
		thumb:SetTexture("Interface\\ChatFrame\\ChatFrameBackground");
		
		if horizontal then
			thumb:SetGradientAlpha("VERTICAL", 0.15, 0.15, 0.15, 1, 0.5, 0.5, 0.5, 0.75)
		else
			thumb:SetGradientAlpha("HORIZONTAL", 0.5, 0.5, 0.5, 0.75, 0.15, 0.15, 0.15, 1)
		end
		
		thumb:SetWidth(BUTTONWIDTH);
		thumb:SetHeight(BUTTONWIDTH);
		bar:SetThumbTexture(thumb);

		-- Create scroll bar buttons
		bar.CreateButton = function(self, oper, horizontal)
			local button = CreateFrame("Button", nil, self);
			button.CreateButtonTexture = function(self, iconPath, horizontal, layer, add)
				local texture = self:CreateTexture(nil, layer or "ARTWORK");
				texture:SetHeight(BUTTONWIDTH * 2);
				texture:SetWidth(BUTTONWIDTH * 2);
				texture:SetTexture(iconPath);
				if horizontal then
					-- Blizzard folks did not even provide horizontal scroll bar button icons, I have to use their vertical ones
					-- and rotate them by 90 degrees, oh man, sorry about the following nasty code.					
					local SQRT2 = math.sqrt(2);
					texture:SetTexCoord(0.5 + math.cos(math.rad(315)) / SQRT2, 0.5 + math.sin(math.rad(315)) / SQRT2,
							    0.5 + math.cos(math.rad(225)) / SQRT2, 0.5 + math.sin(math.rad(225)) / SQRT2,
							    0.5 + math.cos(math.rad(45))  / SQRT2, 0.5 + math.sin(math.rad(45))  / SQRT2, 
							    0.5 + math.cos(math.rad(135)) / SQRT2, 0.5 + math.sin(math.rad(135)) / SQRT2);
				end

				if add then
					texture:SetBlendMode("ADD");
				end				

				texture:SetPoint("CENTER", self, "CENTER");
				return texture;
			end;

			button:SetWidth(BUTTONWIDTH);
			button:SetHeight(BUTTONWIDTH);
			button._oper = oper;

			local texturePrefix = "Interface\\Buttons\\UI-ScrollBar-ScrollUpButton-";
			if oper == 1 then
				texturePrefix = "Interface\\Buttons\\UI-ScrollBar-ScrollDownButton-";
			end

			button:SetNormalTexture(button:CreateButtonTexture(texturePrefix.."Up", horizontal));
			button:SetPushedTexture(button:CreateButtonTexture(texturePrefix.."Down", horizontal));
			button:SetDisabledTexture(button:CreateButtonTexture(texturePrefix.."Disabled", horizontal));
			button:SetHighlightTexture(button:CreateButtonTexture(texturePrefix.."Highlight", horizontal));

			-- Buttons shall be disabled is the Slider value hits its limit.
			button.UpdateStatus = function(self, value)
				value = value or self:GetParent():GetValue();
				local minVal, maxVal = self:GetParent():GetMinMaxValues();
				if (self._oper == -1 and value <= minVal) or (self._oper == 1 and value >= maxVal) then
					self:Disable();
				else
					self:Enable();
				end
			end;

			

			-- Clicks on scroll bar button increases or decreases Slider value, depending on which button is clicked.
			--button:SetScript("OnClick", function() this:OnClick(); end);

			button:SetScript("OnMouseDown", function(self)
				self:SetScript("OnUpdate", function(self, elapse)
					self._updateElapsed = (self._updateElapsed or 10) + elapse;
					if self._updateElapsed > 0.1 then
						self._updateElapsed = 0;
						local parent = self:GetParent();
						parent:SetValue(parent:GetValue() + self._oper * parent:GetValueStep());										
					end					
				end);
			end);

			button:SetScript("OnMouseUp", function(self)				
				self:SetScript("OnUpdate", nil);
				self._updateElapsed = nil;
				PlaySound("UChatScrollButton");
			end);			

			button:UpdateStatus();
			return button;
		end;

		bar.UpdateButtonStatus = function(self, value)
			value = value or self:GetValue();
			bar._button1:UpdateStatus(value);
			bar._button2:UpdateStatus(value);
		end;
		
		bar._button1 = bar:CreateButton(-1, horizontal);
		bar._button2 = bar:CreateButton(1, horizontal);		

		-- Setup the scroll bar layouts
		if horizontal then			
			bar._button1:SetPoint("LEFT", frame, "LEFT", BUTTONWIDTH / 4, 0);			
			bar._button2:SetPoint("RIGHT", frame, "RIGHT", -BUTTONWIDTH / 4, 0);
			bar:SetPoint("LEFT", frame, "LEFT", BUTTONWIDTH * 1.4, 0);
			bar:SetPoint("RIGHT", frame, "RIGHT", -BUTTONWIDTH * 1.4, 0);
		else			
			bar._button1:SetPoint("TOP", frame, "TOP", 0, -BUTTONWIDTH / 4);
			bar._button2:SetPoint("BOTTOM", frame, "BOTTOM", 0, BUTTONWIDTH / 4);
			bar:SetPoint("TOP", frame, "TOP", 0, -BUTTONWIDTH * 1.4);
			bar:SetPoint("BOTTOM", frame, "BOTTOM", 0, BUTTONWIDTH * 1.4);
		end

		bar.OnScrollBarUpdated = function(self)
			local parent = self:GetParent():GetParent();
			if parent and type(parent.OnScrollBarUpdated) == "function" then
				parent:OnScrollBarUpdated(self:GetParent());
			end
		end;		

		bar:SetScript("OnValueChanged", function()
			this:UpdateButtonStatus(arg1);
			local parent = this:GetParent():GetParent();
			if parent and type(parent.OnScrollBarValueChanged) == "function" then
				parent:OnScrollBarValueChanged(this:GetParent(), arg1);
			end			
		end);	

		bar:SetScript("OnShow", function() this:OnScrollBarUpdated(); end);
		bar:SetScript("OnHide", function() this:OnScrollBarUpdated(); end);
		bar:SetScript("OnSizeChanged", function() this:OnScrollBarUpdated(); end);
		
		-- Makes the scroll bar look like a Slider!
		frame.GetOrientation = function(self) return self._bar:GetOrientation(); end;		
		frame.GetValue = function(self) return self._bar:GetValue(); end;
		frame.SetValue = function(self, value) return self._bar:SetValue(value); end;		
		frame.GetValueStep = function(self) return self._bar:GetValueStep(); end;
		frame.SetValueStep = function(self, step) return self._bar:SetValueStep(step); end;
		frame.GetMinMaxValues = function(self) return self._bar:GetMinMaxValues(); end;

		frame.SetMinMaxValues = function(self, minValue, maxValue)
			-- Change the thumbnail texture size to fit the scroll range.
			local horizontal = self:GetOrientation() == "HORIZONTAL";
			local barSize, thumbSize;
			if horizontal then
				barSize = (self._bar:GetRight() or 0) - (self._bar:GetLeft() or 0);				
			else
				barSize = (self._bar:GetTop() or 0) - (self._bar:GetBottom() or 0);				
			end

			local range = maxValue - minValue;
			if range < barSize then				
				thumbSize = barSize - range;				
			else				
				thumbSize = barSize / math.max(range, 1) * BUTTONWIDTH;
			end
			
			thumbSize = math.max(6, math.min(barSize, thumbSize));
			
			if horizontal then
				self._bar:GetThumbTexture():SetWidth(thumbSize);
			else
				self._bar:GetThumbTexture():SetHeight(thumbSize);
			end
			
			self._bar:SetMinMaxValues(minValue, maxValue);
			self._bar:UpdateButtonStatus();
		end;

		frame.UpdateScrollRange = function(self, range)
			if type(range) ~= "number" then
				range = 0;
			end

			if range < 0.01 or range > 1000000 then
				range = 0;
			end

			-- Make the range evenly dividable by value-step, otherwise some bottom/right items might never
			-- be able to scroll up properly when value-step is greater than 1.
			range = math.ceil(range);
			local step = math.max(1, math.ceil(self:GetValueStep()));
			local md = range % step;
			if md > 0 then
				range = range - md + step;
			end
			
			self:SetMinMaxValues(0, range);
			if self:GetValue() >= range then
				self:SetValue(range);
			end
			
			return range > 0 and range;			
		end;

		frame:SetScript("OnMouseWheel", function() this._bar:SetValue(this._bar:GetValue() - arg1 * this._bar:GetValueStep() * 5); end);

		return frame;
	end

	local PRIVATE = "{E82052F8-B0B9-4677-928E-631E9D21252B}"; 
	local SIGNATURE = "{A38788E5-CD67-424C-9089-9A4D80EB9E09}";

	-- The container
	local frame = CreateFrame("Frame", name, parent, template);
	if not frame then
		return nil;
	end	

	-- The bottom-right knob for locating the scroll frame when scroll bar(s) show/hide
	local knob = CreateFrame("Frame", nil, frame);
	knob:SetWidth(BARWIDTH);
	knob:SetHeight(BARWIDTH);
	knob:SetPoint("TOPLEFT", frame, "BOTTOMRIGHT");	

	-- The real scroll frame, inaccessible
	local scrollFrame = CreateFrame("ScrollFrame", nil, frame);
	scrollFrame._knob = knob;

	scrollFrame:EnableMouseWheel(true);
	scrollFrame:SetPoint("TOPLEFT", frame, "TOPLEFT");
	scrollFrame:SetPoint("BOTTOMRIGHT", knob, "TOPLEFT");		

	frame[PRIVATE] = { ["scrollFrame"] = scrollFrame, ["SetScript"] = frame.SetScript, ["GetScript"] = frame.GetScript };

	local scrollChild = CreateFrame("Frame", nil, scrollFrame);	
	scrollFrame:SetScrollChild(scrollChild);
	scrollChild:SetWidth(scrollFrame:GetWidth());
	scrollChild:SetHeight(1);

	scrollFrame._enableV = 1;
	scrollFrame._enableH = 1;
	scrollFrame._vBar = CreateScrollBar(scrollFrame); -- The vertical scroll bar on right side
	scrollFrame._hBar = CreateScrollBar(scrollFrame, 1); -- The horizontal scroll bar on bottom
	
	------------------------------------------------------------
	-- Container Frame Properties
	------------------------------------------------------------

	frame.GetVersion = function() return MAJOR_VERSION, MINOR_VERSION; end;

	frame.SetScript = function(self, script, handler)
		if type(script) == "string" and (script == "OnVerticalScroll" or script == "OnHorizontalScroll") then
			if type(handler) ~= "function" then
				handler = nil;
			end

			if script == "OnVerticalScroll" then
				self[PRIVATE]["OnVerticalScroll"] = handler;
			else
				self[PRIVATE]["OnHorizontalScroll"] = handler;
			end
		else
			self[PRIVATE]["SetScript"](self, script, handler);
		end
	end;

	frame.GetScript = function(self, script)
		if type(script) == "string" and (script == "OnVerticalScroll" or script == "OnHorizontalScroll") then
			return self[PRIVATE][script];			
		else
			return self[PRIVATE]["GetScript"](self, script);
		end
	end	

	frame.GetScrollChild = function(self) return self[PRIVATE]["content"]; end;

	frame.SetScrollChild = function(self, child)		
		if type(child) ~= "table" or type(child.GetPoint) ~= "function" then
			child = nil;
		elseif child[SIGNATURE] then			
			return nil; -- already being a scroll child of someone else
		end

		local original = self:GetScrollChild();
		local originalV = self:GetVerticalScroll();
		local originalH = self:GetHorizontalScroll();

		if original then
			-- Restore functions
			original.ClearAllPoints = original[SIGNATURE]["ClearAllPoints"];
			original.SetAllPoints = original[SIGNATURE]["SetAllPoints"];
			original.SetPoint = original[SIGNATURE]["SetPoint"];
			original.SetParent = original[SIGNATURE]["SetParent"];
			original.GetParent = original[SIGNATURE]["GetParent"];
			original[SIGNATURE] = nil;
			original:ClearAllPoints();
			original:SetParent(nil);
		end

		self[PRIVATE]["content"] = child;

		if child then
			local scrollChild = self[PRIVATE]["scrollFrame"]:GetScrollChild();
			child:SetParent(scrollChild);
			child:ClearAllPoints();
			child:SetPoint("TOPLEFT", scrollChild, "TOPLEFT");
			if self:GetAutoChildWidth() then
				child:SetPoint("TOPRIGHT", scrollChild, "TOPRIGHT");
			end

			if child:GetHeight() == 0 then
				child:SetHeight(1);
			end

			-- Hijack some functions to prevent changes of child anchors and other stuff
			child[SIGNATURE] = { ["parent"] = self, ["ClearAllPoints"] = child.ClearAllPoints, ["SetAllPoints"] = child.SetAllPoints,
					["SetPoint"] = child.SetPoint, ["SetParent"] = child.SetParent, ["GetParent"] = child.GetParent };
			child.ClearAllPoints = function() end;
			child.SetAllPoints = function() end;
			child.SetPoint = function() end;
			child.SetParent = function() end;
			child.GetParent = function(self) return self[SIGNATURE]["parent"]; end;
		end

		self[PRIVATE]["scrollFrame"]._vBar:SetValue(0);
		self[PRIVATE]["scrollFrame"]._hBar:SetValue(0);
		return original, originalV, originalH;
	end;

	frame.SetVerticalScroll = function(self, offset)
		if type(offset) == "number" then
			self[PRIVATE]["scrollFrame"]._vBar:SetValue(offset);
		end
	end;

	frame.GetVerticalScroll = function(self) return self[PRIVATE]["scrollFrame"]:GetVerticalScroll(); end;
	frame.GetVerticalScrollRange = function(self) return self[PRIVATE]["scrollFrame"]:GetVerticalScrollRange(); end;

	frame.SetHorizontalScroll = function(self, offset)
		if type(offset) == "number" then
			self[PRIVATE]["scrollFrame"]._hBar:SetValue(-offset);
		end
	end;

	frame.GetHorizontalScroll = function(self) return self[PRIVATE]["scrollFrame"]:GetHorizontalScroll(); end;
	frame.GetHorizontalScrollRange = function(self) return self[PRIVATE]["scrollFrame"]:GetHorizontalScrollRange(); end;
	frame.UpdateScrollChildRect = function(self) return self[PRIVATE]["scrollFrame"]:UpdateScrollChildRect(); end;
	
	frame.GetAutoChildWidth = function(self) return self[PRIVATE]["auto child width"] end;

	frame.SetAutoChildWidth = function(self, auto)
		if (self:GetAutoChildWidth() and auto) or (not self:GetAutoChildWidth() and not auto) then
			return; -- No change
		end

		self[PRIVATE]["auto child width"] = auto;
		local child = self:GetScrollChild();
		if child then
			local scrollChild = self[PRIVATE]["scrollFrame"]:GetScrollChild();
			child[SIGNATURE]["ClearAllPoints"](child);
			child[SIGNATURE]["SetPoint"](child, "TOPLEFT", scrollChild, "TOPLEFT");
			if auto then
				child[SIGNATURE]["SetPoint"](child, "TOPRIGHT", scrollChild, "TOPRIGHT");
			end
		end
	end;	

	frame.GetScrollStep = function(self) return self[PRIVATE]["scrollFrame"]._vBar:GetValueStep(); end;

	frame.SetScrollStep = function(self, step)
		if type(step) ~= "number" or step < 1 then
			step = 1;
		end

		step = math.ceil(step);

		self[PRIVATE]["scrollFrame"]._vBar:SetValueStep(step);
		self[PRIVATE]["scrollFrame"]._hBar:SetValueStep(step);
		return step;
	end;	

	frame.EnableVerticalBar = function(self)
		if not self:IsVerticalBarEnabled() then
			self[PRIVATE]["scrollFrame"]._enableV = 1;
			self[PRIVATE]["scrollFrame"]:UpdateScrollBarsRange();
		end
	end;

	frame.DisableVerticalBar = function(self)
		if self:IsVerticalBarEnabled() then
			self[PRIVATE]["scrollFrame"]._enableV = nil;
			self[PRIVATE]["scrollFrame"]:UpdateScrollBarsRange();
		end
	end;

	frame.IsVerticalBarEnabled = function(self) return self[PRIVATE]["scrollFrame"]._enableV; end;

	frame.EnableHorizontalBar = function(self)
		if not self:IsHorizontalBarEnabled() then
			self[PRIVATE]["scrollFrame"]._enableH = 1;
			self[PRIVATE]["scrollFrame"]:UpdateScrollBarsRange();
		end
	end;

	frame.DisableHorizontalBar = function(self)
		if self:IsHorizontalBarEnabled() then
			self[PRIVATE]["scrollFrame"]._enableH = nil;
			self[PRIVATE]["scrollFrame"]:UpdateScrollBarsRange();
		end
	end;

	frame.IsHorizontalBarEnabled = function(self) return self[PRIVATE]["scrollFrame"]._enableH; end;

	local function IsRegionInRegion(interior, exterior)
		local l1, t1, r1, b1 = interior:GetLeft(), interior:GetTop(), interior:GetRight(), interior:GetBottom();
		local l2, t2, r2, b2 = exterior:GetLeft(), exterior:GetTop(), exterior:GetRight(), exterior:GetBottom();
		if not (l1 and t1 and r1 and b1 and l2 and t2 and r2 and b2) then
			return nil; -- one or both regions are invalid
		end
		local l, t, r, b = l1 - l2, t1 - t2, r1 - r2, b1 - b2;
		return (l >= 0 and t <= 0 and r <= 0 and b >= 0), l, t, r, b;
	end;
	
	frame.CheckVisible = function(self, left, top, right, bottom)		
		if not (type(left) == "number" and type(top) == "number" and type(right) == "number" and type(bottom) == "number") then
			return nil;
		end

		local frame = self[PRIVATE]["scrollFrame"];
		local l2, t2, r2, b2 = frame:GetLeft(), frame:GetTop(), frame:GetRight(), frame:GetBottom();
		if not (l2 and t2 and r2 and b2) then
			return nil;
		end

		local l, t, r, b = left - l2, top - t2, right - r2, bottom - b2;
		local result = 1;
		if l < 0 or t > 0 or r > 0 or b < 0 then
			result = 0;
		end
		
		return result, l, t, r, b; -- 0: out of boundary, 1: in boundary, nil: invalid
	end;	

	frame.EnsureVisible = function(self, left, top, right, bottom, ignoreHorizontal, ignoreVertical)
		if not ignoreHorizontal or not ignoreVertical then
			local result, l, t, r, b = self:CheckVisible(left, top, right, bottom);
			if result == 0 then
				if not ignoreHorizontal then
					if l < 0 then
						-- scroll to left of the region
						self:SetHorizontalScroll(self:GetHorizontalScroll() - l);
					elseif r > 0 then
						-- scroll to right of the region
						self:SetHorizontalScroll(self:GetHorizontalScroll() - r);
					end
				end

				if not ignoreVertical then
					if t > 0 then
						-- scroll to top of the region
						self:SetVerticalScroll(self:GetVerticalScroll() - t);
					elseif b < 0 then
						-- scroll to bottom of the region
						self:SetVerticalScroll(self:GetVerticalScroll() - b);
					end
				end
			end
		end
		return self:GetHorizontalScroll(), self:GetVerticalScroll();
	end;	

	frame.CheckRegionVisible = function(self, region)
		if type(region) ~= "table" or type(region.GetLeft) ~= "function" then
			return nil;
		end
		return self:CheckVisible(region:GetLeft(), region:GetTop(), region:GetRight(), region:GetBottom());
	end;

	frame.EnsureRegionVisible = function(self, region, ignoreHorizontal, ignoreVertical)
		if type(region) ~= "table" or type(region.GetLeft) ~= "function" then
			return self:GetHorizontalScroll(), self:GetVerticalScroll();
		end
		return self:EnsureVisible(region:GetLeft(), region:GetTop(), region:GetRight(), region:GetBottom(), ignoreHorizontal, ignoreVertical);
	end;

	frame.ScrollToTop = function(self)
		local low, hi = self[PRIVATE]["scrollFrame"]._vBar:GetMinMaxValues();
		self[PRIVATE]["scrollFrame"]._vBar:SetValue(low);
	end;

	frame.ScrollToBottom = function(self)
		local low, hi = self[PRIVATE]["scrollFrame"]._vBar:GetMinMaxValues();
		self[PRIVATE]["scrollFrame"]._vBar:SetValue(hi);
	end;

	frame.ScrollToLeft = function(self)
		local low, hi = self[PRIVATE]["scrollFrame"]._hBar:GetMinMaxValues();
		self[PRIVATE]["scrollFrame"]._hBar:SetValue(low);
	end;

	frame.ScrollToRight = function(self)
		local low, hi = self[PRIVATE]["scrollFrame"]._hBar:GetMinMaxValues();
		self[PRIVATE]["scrollFrame"]._hBar:SetValue(hi);
	end;

	------------------------------------------------------------
	-- The Real ScrollFrame(Inaccessible) Properties
	------------------------------------------------------------	
	
	scrollFrame.UpdateScrollBarsRange = function(self, h, v)
		self._hBar:UpdateScrollRange(h or self:GetHorizontalScrollRange());
		self._vBar:UpdateScrollRange(v or self:GetVerticalScrollRange());

		if self._hBar:UpdateScrollRange(h or self:GetHorizontalScrollRange()) and self._enableH then
			self._hBar:Show();
		else
			self._hBar:Hide();
			if self:GetHorizontalScroll() ~= 0 then
				self:SetHorizontalScroll(0);
			end
		end

		if self._vBar:UpdateScrollRange(v or self:GetVerticalScrollRange()) and self._enableV then
			self._vBar:Show();
		else
			self._vBar:Hide();
			if self:GetVerticalScroll() ~= 0 then
				self:GetVerticalScroll(0);
			end
		end
	end;

	scrollFrame.OnScrollBarUpdated = function(self)
		self._knob:ClearAllPoints();		
		self._vBar:ClearAllPoints();
		self._hBar:ClearAllPoints();

		local POINTS = { "TOPLEFT", "TOPRIGHT", "BOTTOMLEFT", "BOTTOMRIGHT" };
		local score = 1;		

		if self._vBar:IsShown() then
			score = score + 1;
			self._vBar:SetPoint("TOPRIGHT", self:GetParent(), "TOPRIGHT", 2, 2);
			if self._hBar:IsShown() then
				self._vBar:SetPoint("BOTTOMRIGHT", self._knob, "TOPRIGHT", 2, -BARWIDTH * 0.25);
			else
				self._vBar:SetPoint("BOTTOMRIGHT", self._knob, "TOPRIGHT", 2, -2);
			end
		end

		if self._hBar:IsShown() then
			score = score + 2;
			self._hBar:SetPoint("BOTTOMLEFT", self:GetParent(), "BOTTOMLEFT", -2, -2);
			if self._vBar:IsShown() then
				self._hBar:SetPoint("BOTTOMRIGHT", self._knob, "BOTTOMLEFT", BARWIDTH * 0.25, -2);
			else
				self._hBar:SetPoint("BOTTOMRIGHT", self._knob, "BOTTOMLEFT", 2, -2);
			end
		end

		self._knob:SetPoint(POINTS[score], self:GetParent(), "BOTTOMRIGHT");		
	end
	
	scrollFrame.OnScrollBarValueChanged = function(self, bar, value)
		if bar:GetOrientation() == "HORIZONTAL" then
			self:SetHorizontalScroll(-value);
		else
			self:SetVerticalScroll(value);
		end
	end;
	
	scrollFrame:SetScript("OnSizeChanged", function()	
		this:GetScrollChild():SetWidth(this:GetWidth()); 
		this:UpdateScrollBarsRange();
	end);

	scrollFrame:SetScript("OnShow", function() this:UpdateScrollBarsRange(); end);

	scrollFrame:SetScript("OnMouseWheel", function()
		local bar = this._vBar;
		if bar:IsShown() then
			bar:SetValue(bar:GetValue() - arg1 * bar:GetValueStep() * 5);
		end
	end);

	scrollFrame:SetScript("OnScrollRangeChanged", function() this:UpdateScrollBarsRange(arg1, arg2); end);

	scrollFrame:SetScript("OnVerticalScroll", function()
		local handler = this:GetParent():GetScript("OnVerticalScroll");
		if type(handler) == "function" then
			handler(this:GetParent(), arg1);
		end
	end);
	
	scrollFrame:SetScript("OnHorizontalScroll", function()
		local handler = this:GetParent():GetScript("OnHorizontalScroll");
		if type(handler) == "function" then
			handler(this:GetParent(), arg1);
		end
	end);

	return frame;
end


-- Provides version check
function UICreateScrollFrameIsNewerVersion(major, minor)
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