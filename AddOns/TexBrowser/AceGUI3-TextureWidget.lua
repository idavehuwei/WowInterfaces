local AceGUI = LibStub("AceGUI-3.0")

--------------------------
-- Button		        --
--------------------------
do
	local texFrame = CreateFrame("Frame")
	local Type = "Texture"
	local Version = 1
	
	local function OnAcquire(self)
	end
	
	local function OnRelease(self)
		self.frame:ClearAllPoints()
		self.frame:Hide()
		self:SetDisabled(false)
		self.selectFrame:Hide()
		self.tex:SetVertexColor(1, 1, 1, 1)
		self.tex:SetTexCoord(0,1,0,1)
		self:EnableSelect(false)
	end
	
	local function SetTexture(self, texture)
		self.tex:SetTexture(texture)
	end
	
	local function SetTexCoord(self, ...)
		self.tex:SetTexCoord(...)
	end
	
	local function SetDisabled(self, disabled)
		self.disabled = disabled
		if disabled then
			self.frame:Disable()
		else
			self.frame:Enable()
		end
	end
	
	local function SetVertexColor(self, ...)	
		self.tex:SetVertexColor(...)
	end
		
	local function mouseMove(self)
		local mx, my = GetCursorPosition()
		local scale = UIParent:GetEffectiveScale()		
		mx, my = mx / scale, my / scale
	
		local f = self.obj.selectFrame
		local width, height = mx - f:GetLeft(), -(my - f:GetTop())
		local sw, sh = self:GetRight() - self:GetLeft(), self:GetTop() - self:GetBottom()
		width = min(sw - f:GetLeft() + self:GetLeft(), width)
		height = min(sh - self:GetTop() + f:GetTop(), height)
		width, height = max(1, width), max(1, height)
		f:SetWidth(width)
		f:SetHeight(height)
		local x1, x2, y1, y2
		if width == 1 and height == 1 then
			x1, x2, y1, y2 = 0, 1, 0, 1
		else
			x1 = (f:GetLeft() - self:GetLeft()) / sw
			x2 = (f:GetLeft() + f:GetWidth() - self:GetLeft()) / sw
			y1 = (self:GetTop() - f:GetTop()) / sh
			y2 = (self:GetTop() + f:GetHeight() - f:GetTop()) / sh
		end
		self.obj:Fire("OnRectChanged", x1, x2, y1, y2)
	end
	
	local function mouseDown(self)
		local mx, my = GetCursorPosition()
		local scale = UIParent:GetEffectiveScale()		
		mx, my = mx / scale, my / scale
		
		local x, y, w, h = self:GetLeft(), self:GetTop(), self:GetRight() - self:GetLeft() - 20, self:GetTop() - self:GetBottom() - 20
		local f = self.obj.selectFrame
		
		f:SetPoint("TOPLEFT", self, "TOPLEFT", mx - x, my - y)
		f:SetWidth(1)
		f:SetHeight(1)
		f:Show()
		
		self:SetScript("OnUpdate", mouseMove)
		do return end

		x, y = x * scale, y * scale
		local sx, sy = mx - x, my - y
	end
	
	local function mouseUp(self)
		self:SetScript("OnUpdate", nil)
	end
	
	local selectBackdrop = {
		bgFile = "Interface\\BUTTONS\\WHITE8X8.BLP",
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
		inset = 4,
		edgeSize = 4,
		tile = true,
		insets = {left = 1, right = 1, top = 1, bottom = 1}
	}
	
	local backdrop = {
		bgFile = "Interface\\AddOns\\TexBrowser\\chex",
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
		inset = 4,
		edgeSize = 16,
		tileSize = 18,
		tile = true,
		insets = {left = 3, right = 3, top = 3, bottom = 3}
	}
	
	local function EnableSelect(self, flag)
		self.frame:SetScript("OnMouseDown", flag and mouseDown or nil)
		self.frame:SetScript("OnMouseUp", flag and mouseUp or nil)
		self.selectFrame:Hide()
	end
		
	local function Constructor()
		local self = {}
		
		local num  = AceGUI:GetNextWidgetNum(Type)
		local frame = CreateFrame("Button","AceGUI30Texture"..num,UIParent)
		local tex = frame:CreateTexture()
		
		frame:SetBackdrop(backdrop)
		
		local selectFrame = CreateFrame("Frame", nil, frame)
		selectFrame:SetBackdrop(selectBackdrop)
		selectFrame:Hide()
		selectFrame:SetFrameStrata("TOOLTIP")
		selectFrame:SetAlpha(0.5)
		selectFrame:SetBackdropColor(0,0.7,0,1)
		self.selectFrame = selectFrame
		
		tex:SetPoint("TOPLEFT", frame, "TOPLEFT", 2, -2)
		tex:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -2, 2)
		self.tex = tex
		
		self.num = num
		self.type = Type
		self.frame = frame

		frame:SetHeight(256)
		frame:SetWidth(256)
	
		self.OnRelease = OnRelease
		self.OnAcquire = OnAcquire
		self.SetDisabled = SetDisabled
		self.SetTexture = SetTexture
		self.SetVertexColor = SetVertexColor
		self.SetTexCoord = SetTexCoord
		self.EnableSelect = EnableSelect
		
		self.frame = frame
		frame.obj = self

		AceGUI:RegisterAsWidget(self)
		return self
	end
	
	AceGUI:RegisterWidgetType(Type,Constructor,Version)
end
