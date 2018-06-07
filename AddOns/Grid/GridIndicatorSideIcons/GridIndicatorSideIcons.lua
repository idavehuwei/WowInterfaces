-- -------------------------------------------------------------------------- --
-- GridIndicatorSideIcons by kunda                                            --
-- -------------------------------------------------------------------------- --

local GridFrame = Grid:GetModule("GridFrame")
local L = GridIndicatorSideIcons_Locales
local AceOO = AceLibrary("AceOO-2.0")
local media = LibStub("LibSharedMedia-3.0", true)

local GridIndicatorSideIcons = Grid:GetModule("GridStatus"):NewModule("GridIndicatorSideIcons")

GridIndicatorSideIcons.defaultDB = {
	iconSizeTop = 8,
	iconSizeBottom = 8,
	iconSizeLeft = 8,
	iconSizeRight = 8,
	xoffsetTB = 0,
	yoffsetTB = 0,
	xoffsetLR = 0,
	yoffsetLR = 0,
	iconBorderSize = 0,
	enableIconStackText = false,
	enableIconCooldown = false,
}

local indicators = GridFrame.frameClass.prototype.indicators
table.insert(indicators, { type = "icontop",		order = 7.11, name = L["Top Icon"] })
table.insert(indicators, { type = "iconbottom",	order = 7.12, name = L["Bottom Icon"] })
table.insert(indicators, { type = "iconleft",		order = 7.13, name = L["Left Icon"] })
table.insert(indicators, { type = "iconright",	order = 7.14, name = L["Right Icon"] })

local statusmap = GridFrame.defaultDB.statusmap
if ( not statusmap["icontop"] ) then
	statusmap["icontop"] = {}
	statusmap["iconbottom"] = {}
	statusmap["iconleft"] = {}
	statusmap["iconright"] = {}
end

if(GridFrame and GridFrame.db and GridFrame.db.profile) then
	statusmap = GridFrame.db.profile.statusmap
	if ( not statusmap["icontop"] ) then
		statusmap["icontop"] = {}
		statusmap["iconbottom"] = {}
		statusmap["iconleft"] = {}
		statusmap["iconright"] = {}
	end
end

local GridIndicatorSideIconsFrameClass = AceOO.Class(GridFrame.frameClass)

local _frameClass = nil
if not _frameClass then
	_frameClass = GridFrame.frameClass
	GridFrame.frameClass = GridIndicatorSideIconsFrameClass
end

function GridIndicatorSideIcons:OnEnable()
	self:CleanOptionsMenu() -- hack for better indicator menu

	GridFrame.options.args.advanced.args["sideicons"] = {
		type = "group",
		name = L["Icon (Sides)"],
		desc = L["Options for Icon (Sides) indicators."],
		order = 106,
		args = {
			["iconbordersize"] = {
				type = "range",
				name = L["Icon Border Size"],
				desc = L["Adjust the size of the icon's border."],
				order = 106.01,
				min = 0,
				max = 9,
				step = 1,
				get = function ()
					return GridIndicatorSideIcons.db.profile.iconBorderSize
				end,
				set = function (v)
					GridIndicatorSideIcons.db.profile.iconBorderSize = v
					GridFrame:UpdateAllFrames()
					GridFrame:WithAllFrames(function (f) f:SetIconSize(nil, v) end)
				end,
			},
			["iconstacktext"] = {
				type = "toggle",
				name = L["Enable Icon Stack Text"],
				desc = L["Toggle icon's stack count text."],
				order = 106.02,
				get = function()
					return GridIndicatorSideIcons.db.profile.enableIconStackText
				end,
				set = function(v)
					GridIndicatorSideIcons.db.profile.enableIconStackText = v
					GridFrame:UpdateAllFrames()
				end,
			},
			["iconcooldown"] = {
				type = "toggle",
				name = L["Enable Icon Cooldown Frame"],
				desc = L["Toggle icon's cooldown frame."],
				order = 106.03,
				get = function()
					return GridIndicatorSideIcons.db.profile.enableIconCooldown
				end,
				set = function(v)
					GridIndicatorSideIcons.db.profile.enableIconCooldown = v
					GridFrame:UpdateAllFrames()
				end,
			},
			["iconsizetop"] = {
				type = "range",
				name = L["Icon Size Top"],
				desc = L["Adjust the size of the top icon."],
				order = 106.04,
				min = 5,
				max = 50,
				step = 1,
				get = function ()
					return GridIndicatorSideIcons.db.profile.iconSizeTop
				end,
				set = function (v)
					GridIndicatorSideIcons.db.profile.iconSizeTop = v
					GridFrame:WithAllFrames(function (f) f:SetIconSize(v) end)
				end,
			},
			["iconsizebottom"] = {
				type = "range",
				name = L["Icon Size Bottom"],
				desc = L["Adjust the size of the bottom icon."],
				order = 106.05,
				min = 5,
				max = 50,
				step = 1,
				get = function ()
					return GridIndicatorSideIcons.db.profile.iconSizeBottom
				end,
				set = function (v)
					GridIndicatorSideIcons.db.profile.iconSizeBottom = v
					GridFrame:WithAllFrames(function (f) f:SetIconSize(v) end)
				end,
			},
			["iconsizeleft"] = {
				type = "range",
				name = L["Icon Size Left"],
				desc = L["Adjust the size of the left icon."],
				order = 106.06,
				min = 5,
				max = 50,
				step = 1,
				get = function ()
					return GridIndicatorSideIcons.db.profile.iconSizeLeft
				end,
				set = function (v)
					GridIndicatorSideIcons.db.profile.iconSizeLeft = v
					GridFrame:WithAllFrames(function (f) f:SetIconSize(v) end)
				end,
			},
			["iconsizeright"] = {
				type = "range",
				name = L["Icon Size Right"],
				desc = L["Adjust the size of the right icon."],
				order = 106.07,
				min = 5,
				max = 50,
				step = 1,
				get = function ()
					return GridIndicatorSideIcons.db.profile.iconSizeRight
				end,
				set = function (v)
					GridIndicatorSideIcons.db.profile.iconSizeRight = v
					GridFrame:WithAllFrames(function (f) f:SetIconSize(v) end)
				end,
			},
			["xoffsetTB"] = {
				type = "range",
				name = L["Offset X-axis (top/bottom)"],
				desc = L["Adjust the offset of the X-axis for the top and bottom icon."],
				order = 106.08,
				min = -20,
				max = 20,
				step = 1,
				get = function ()
					return GridIndicatorSideIcons.db.profile.xoffsetTB
				end,
				set = function (v)
					GridIndicatorSideIcons.db.profile.xoffsetTB = v
					GridFrame:WithAllFrames(function (f) f:SetIconSize(v) end)
				end,
			},
			["yoffsetTB"] = {
				type = "range",
				name = L["Offset Y-axis (top/bottom)"],
				desc = L["Adjust the offset of the Y-axis for the top and bottom icon."],
				order = 106.09,
				min = -20,
				max = 20,
				step = 1,
				get = function ()
					return GridIndicatorSideIcons.db.profile.yoffsetTB
				end,
				set = function (v)
					GridIndicatorSideIcons.db.profile.yoffsetTB = v
					GridFrame:WithAllFrames(function (f) f:SetIconSize(v) end)
				end,
			},
			["xoffsetLR"] = {
				type = "range",
				name = L["Offset X-axis (left/right)"],
				desc = L["Adjust the offset of the X-axis for the left and right icon."],
				order = 106.10,
				min = -20,
				max = 20,
				step = 1,
				get = function ()
					return GridIndicatorSideIcons.db.profile.xoffsetLR
				end,
				set = function (v)
					GridIndicatorSideIcons.db.profile.xoffsetLR = v
					GridFrame:WithAllFrames(function (f) f:SetIconSize(v) end)
				end,
			},
			["yoffsetLR"] = {
				type = "range",
				name = L["Offset Y-axis (left/right)"],
				desc = L["Adjust the offset of the Y-axis for the left and right icon."],
				order = 106.11,
				min = -20,
				max = 20,
				step = 1,
				get = function ()
					return GridIndicatorSideIcons.db.profile.yoffsetLR
				end,
				set = function (v)
					GridIndicatorSideIcons.db.profile.yoffsetLR = v
					GridFrame:WithAllFrames(function (f) f:SetIconSize(v) end)
				end,
			}
		}
	}
	hooksecurefunc(GridFrame, "UpdateOptionsMenu", GridIndicatorSideIcons.CleanOptionsMenu) -- hack for better indicator menu
end

function GridIndicatorSideIcons:CleanOptionsMenu()
	GridFrame.options.args["sideicons"] = {
		type = "group",
		icon = "Interface\\QuestFrame\\UI-Quest-BulletPoint",
		name = L["Icon (Sides)"],
		desc = L["Options for Icon (Sides) indicators."],
		order = 57.1,
		args = {
			["icontop"]    = GridFrame.options.args.icontop,
			["iconbottom"] = GridFrame.options.args.iconbottom,
			["iconleft"]   = GridFrame.options.args.iconleft,
			["iconright"]  = GridFrame.options.args.iconright
		}
	}
	GridFrame.options.args.icontop = nil
	GridFrame.options.args.iconbottom = nil
	GridFrame.options.args.iconleft = nil
	GridFrame.options.args.iconright = nil
end

function GridIndicatorSideIconsFrameClass.prototype:CreateIndicator(indicator)
	GridIndicatorSideIconsFrameClass.super.prototype.CreateIndicator(self, indicator)
	local f = self.frame
	local font = media and media:Fetch("font", GridFrame.db.profile.font) or STANDARD_TEXT_FONT
	local xoffsetTB = GridIndicatorSideIcons.db.profile.xoffsetTB
	local yoffsetTB = GridIndicatorSideIcons.db.profile.yoffsetTB
	local xoffsetLR = GridIndicatorSideIcons.db.profile.xoffsetLR
	local yoffsetLR = GridIndicatorSideIcons.db.profile.yoffsetLR
	if indicator == "icontop" then
		local wh = GridIndicatorSideIcons.db.profile.iconSizeTop

		-- create icon background/border
		f.icontopBG = CreateFrame("Frame", nil, f)
		f.icontopBG:SetWidth(wh + GridIndicatorSideIcons.db.profile.iconBorderSize * 2)
		f.icontopBG:SetHeight(wh + GridIndicatorSideIcons.db.profile.iconBorderSize * 2)
		f.icontopBG:SetPoint("TOP", f, "TOP", xoffsetTB, yoffsetTB)
		f.icontopBG:SetBackdrop( {
					edgeFile = "Interface\\Addons\\Grid\\white16x16", edgeSize = 2,
					insets = {left = 2, right = 2, top = 2, bottom = 2},
					})
		f.icontopBG:SetBackdropBorderColor(1, 1, 1, 0)
		f.icontopBG:SetBackdropColor(0, 0, 0, 0)
		f.icontopBG:SetFrameLevel(5)
		f.icontopBG:Hide()

		-- create icon
		f.icontop = f.icontopBG:CreateTexture(nil, "OVERLAY")
		f.icontop:SetWidth(wh)
		f.icontop:SetHeight(wh)
		f.icontop:SetPoint("CENTER", f.icontopBG, "CENTER")
		f.icontop:SetTexCoord(0.05, 0.95, 0.05, 0.95)
		f.icontop:SetTexture(1,1,1,0)

		-- create icon text
		f.icontopText = f.icontopBG:CreateFontString(nil, "OVERLAY")
		f.icontopText:SetAllPoints(f.icontopBG)
		f.icontopText:SetFontObject(GameFontHighlightSmall)
		f.icontopText:SetFont(font, GridFrame.db.profile.fontSize)
		f.icontopText:SetJustifyH("CENTER")
		f.icontopText:SetJustifyV("CENTER")

		-- create icon cooldown
		f.icontopCD = CreateFrame("Cooldown", nil, f.icontopBG, "CooldownFrameTemplate")
		f.icontopCD:SetAllPoints(f.icontop)
		f.icontopCD:SetScript("OnHide", function()
			f.icontopStackText:SetParent(f.icontopBG)
			f.icontopStackText:SetPoint("BOTTOMRIGHT", f.icontopBG, 2, -2)
		end)

		-- create icon stack text
		f.icontopStackText = f.icontopBG:CreateFontString(nil, "OVERLAY")
		f.icontopStackText:SetPoint("BOTTOMRIGHT", f.icontopBG, 2, -2)
		f.icontopStackText:SetFontObject(GameFontHighlightSmall)
		f.icontopStackText:SetFont(font, GridFrame.db.profile.fontSize, "OUTLINE")
		f.icontopStackText:SetJustifyH("RIGHT")
		f.icontopStackText:SetJustifyV("BOTTOM")
	elseif indicator == "iconbottom" then
		local wh = GridIndicatorSideIcons.db.profile.iconSizeBottom

		-- create icon background/border
		f.iconbottomBG = CreateFrame("Frame", nil, f)
		f.iconbottomBG:SetWidth(wh + GridIndicatorSideIcons.db.profile.iconBorderSize * 2)
		f.iconbottomBG:SetHeight(wh + GridIndicatorSideIcons.db.profile.iconBorderSize * 2)
		f.iconbottomBG:SetPoint("BOTTOM", f, "BOTTOM", xoffsetTB, (yoffsetTB*-1))
		f.iconbottomBG:SetBackdrop( {
					edgeFile = "Interface\\Addons\\Grid\\white16x16", edgeSize = 2,
					insets = {left = 2, right = 2, top = 2, bottom = 2},
					})
		f.iconbottomBG:SetBackdropBorderColor(1, 1, 1, 0)
		f.iconbottomBG:SetBackdropColor(0, 0, 0, 0)
		f.iconbottomBG:SetFrameLevel(5)
		f.iconbottomBG:Hide()

		-- create icon
		f.iconbottom = f.iconbottomBG:CreateTexture(nil, "OVERLAY")
		f.iconbottom:SetWidth(wh)
		f.iconbottom:SetHeight(wh)
		f.iconbottom:SetPoint("CENTER", f.iconbottomBG, "CENTER")
		f.iconbottom:SetTexCoord(0.05, 0.95, 0.05, 0.95)
		f.iconbottom:SetTexture(1,1,1,0)

		-- create icon text
		f.iconbottomText = f.iconbottomBG:CreateFontString(nil, "OVERLAY")
		f.iconbottomText:SetAllPoints(f.iconbottomBG)
		f.iconbottomText:SetFontObject(GameFontHighlightSmall)
		f.iconbottomText:SetFont(font, GridFrame.db.profile.fontSize)
		f.iconbottomText:SetJustifyH("CENTER")
		f.iconbottomText:SetJustifyV("CENTER")

		-- create icon cooldown
		f.iconbottomCD = CreateFrame("Cooldown", nil, f.iconbottomBG, "CooldownFrameTemplate")
		f.iconbottomCD:SetAllPoints(f.iconbottom)
		f.iconbottomCD:SetScript("OnHide", function()
			f.iconbottomStackText:SetParent(f.iconbottomBG)
			f.iconbottomStackText:SetPoint("BOTTOMRIGHT", f.iconbottomBG, 2, -2)
		end)

		-- create icon stack text
		f.iconbottomStackText = f.iconbottomBG:CreateFontString(nil, "OVERLAY")
		f.iconbottomStackText:SetPoint("BOTTOMRIGHT", f.iconbottomBG, 2, -2)
		f.iconbottomStackText:SetFontObject(GameFontHighlightSmall)
		f.iconbottomStackText:SetFont(font, GridFrame.db.profile.fontSize, "OUTLINE")
		f.iconbottomStackText:SetJustifyH("RIGHT")
		f.iconbottomStackText:SetJustifyV("BOTTOM")
	elseif indicator == "iconleft" then
		local wh = GridIndicatorSideIcons.db.profile.iconSizeLeft

		-- create icon background/border
		f.iconleftBG = CreateFrame("Frame", nil, f)
		f.iconleftBG:SetWidth(wh + GridIndicatorSideIcons.db.profile.iconBorderSize * 2)
		f.iconleftBG:SetHeight(wh + GridIndicatorSideIcons.db.profile.iconBorderSize * 2)
		f.iconleftBG:SetPoint("LEFT", f, "LEFT", (xoffsetLR*-1), yoffsetLR)
		f.iconleftBG:SetBackdrop( {
					edgeFile = "Interface\\Addons\\Grid\\white16x16", edgeSize = 2,
					insets = {left = 2, right = 2, top = 2, bottom = 2},
					})
		f.iconleftBG:SetBackdropBorderColor(1, 1, 1, 0)
		f.iconleftBG:SetBackdropColor(0, 0, 0, 0)
		f.iconleftBG:SetFrameLevel(5)
		f.iconleftBG:Hide()

		-- create icon
		f.iconleft = f.iconleftBG:CreateTexture(nil, "OVERLAY")
		f.iconleft:SetWidth(wh)
		f.iconleft:SetHeight(wh)
		f.iconleft:SetPoint("CENTER", f.iconleftBG, "CENTER")
		f.iconleft:SetTexCoord(0.05, 0.95, 0.05, 0.95)
		f.iconleft:SetTexture(1,1,1,0)

		-- create icon text
		f.iconleftText = f.iconleftBG:CreateFontString(nil, "OVERLAY")
		f.iconleftText:SetAllPoints(f.iconleftBG)
		f.iconleftText:SetFontObject(GameFontHighlightSmall)
		f.iconleftText:SetFont(font, GridFrame.db.profile.fontSize)
		f.iconleftText:SetJustifyH("CENTER")
		f.iconleftText:SetJustifyV("CENTER")

		-- create icon cooldown
		f.iconleftCD = CreateFrame("Cooldown", nil, f.iconleftBG, "CooldownFrameTemplate")
		f.iconleftCD:SetAllPoints(f.iconleft)
		f.iconleftCD:SetScript("OnHide", function()
			f.iconleftStackText:SetParent(f.iconleftBG)
			f.iconleftStackText:SetPoint("BOTTOMRIGHT", f.iconleftBG, 2, -2)
		end)

		-- create icon stack text
		f.iconleftStackText = f.iconleftBG:CreateFontString(nil, "OVERLAY")
		f.iconleftStackText:SetPoint("BOTTOMRIGHT", f.iconleftBG, 2, -2)
		f.iconleftStackText:SetFontObject(GameFontHighlightSmall)
		f.iconleftStackText:SetFont(font, GridFrame.db.profile.fontSize, "OUTLINE")
		f.iconleftStackText:SetJustifyH("RIGHT")
		f.iconleftStackText:SetJustifyV("BOTTOM")
	elseif indicator == "iconright" then
		local wh = GridIndicatorSideIcons.db.profile.iconSizeRight

		-- create icon background/border
		f.iconrightBG = CreateFrame("Frame", nil, f)
		f.iconrightBG:SetWidth(wh + GridIndicatorSideIcons.db.profile.iconBorderSize * 2)
		f.iconrightBG:SetHeight(wh + GridIndicatorSideIcons.db.profile.iconBorderSize * 2)
		f.iconrightBG:SetPoint("RIGHT", f, "RIGHT", xoffsetLR, yoffsetLR)
		f.iconrightBG:SetBackdrop( {
					edgeFile = "Interface\\Addons\\Grid\\white16x16", edgeSize = 2,
					insets = {left = 2, right = 2, top = 2, bottom = 2},
					})
		f.iconrightBG:SetBackdropBorderColor(1, 1, 1, 0)
		f.iconrightBG:SetBackdropColor(0, 0, 0, 0)
		f.iconrightBG:SetFrameLevel(5)
		f.iconrightBG:Hide()

		-- create icon
		f.iconright = f.iconrightBG:CreateTexture(nil, "OVERLAY")
		f.iconright:SetWidth(wh)
		f.iconright:SetHeight(wh)
		f.iconright:SetPoint("CENTER", f.iconrightBG, "CENTER")
		f.iconright:SetTexCoord(0.05, 0.95, 0.05, 0.95)
		f.iconright:SetTexture(1,1,1,0)

		-- create icon text
		f.iconrightText = f.iconrightBG:CreateFontString(nil, "OVERLAY")
		f.iconrightText:SetAllPoints(f.iconrightBG)
		f.iconrightText:SetFontObject(GameFontHighlightSmall)
		f.iconrightText:SetFont(font, GridFrame.db.profile.fontSize)
		f.iconrightText:SetJustifyH("CENTER")
		f.iconrightText:SetJustifyV("CENTER")

		-- create icon cooldown
		f.iconrightCD = CreateFrame("Cooldown", nil, f.iconrightBG, "CooldownFrameTemplate")
		f.iconrightCD:SetAllPoints(f.iconright)
		f.iconrightCD:SetScript("OnHide", function()
			f.iconrightStackText:SetParent(f.iconrightBG)
			f.iconrightStackText:SetPoint("BOTTOMRIGHT", f.iconrightBG, 2, -2)
		end)

		-- create icon stack text
		f.iconrightStackText = f.iconrightBG:CreateFontString(nil, "OVERLAY")
		f.iconrightStackText:SetPoint("BOTTOMRIGHT", f.iconrightBG, 2, -2)
		f.iconrightStackText:SetFontObject(GameFontHighlightSmall)
		f.iconrightStackText:SetFont(font, GridFrame.db.profile.fontSize, "OUTLINE")
		f.iconrightStackText:SetJustifyH("RIGHT")
		f.iconrightStackText:SetJustifyV("BOTTOM")
	end
end

function GridIndicatorSideIconsFrameClass.prototype:SetIndicator(indicator, color, text, value, maxValue, texture, start, duration, stack)
	GridIndicatorSideIconsFrameClass.super.prototype.SetIndicator(self, indicator, color, text, value, maxValue, texture, start, duration, stack)
	if indicator == "icontop"
	or indicator == "iconbottom"
	or indicator == "iconleft"
	or indicator == "iconright"
	then
		if not self.frame[indicator] then
			self:CreateIndicator(indicator)
		end
		if texture then

			if type(texture) == "table" then
				self.frame[indicator]:SetTexture(texture.r, texture.g, texture.b, texture.a)
			else
				self.frame[indicator]:SetTexture(texture)
			end

			if type(color) == "table" and not color.ignore then
				if GridIndicatorSideIcons.db.profile.iconBorderSize > 0 then
					self.frame[indicator.."BG"]:SetBackdropBorderColor(color.r, color.g, color.b, color.a)
				end
				self.frame[indicator]:SetAlpha(color.a)
			else
				self.frame[indicator.."BG"]:SetBackdropBorderColor(0, 0, 0, 0)
				self.frame[indicator]:SetAlpha(1)
			end

			if type(duration) == "number" and duration > 0 and type(start) == "number" and start > 0 and GridIndicatorSideIcons.db.profile.enableIconCooldown then
				self.frame[indicator.."CD"]:SetCooldown(start, duration)
				self.frame[indicator.."CD"]:Show()
				self.frame[indicator.."StackText"]:SetParent(self.frame[indicator.."CD"])
				self.frame[indicator.."StackText"]:SetPoint("BOTTOMRIGHT", self.frame[indicator.."BG"], 2, -2)
			else
				self.frame[indicator.."CD"]:Hide()
			end

			if tonumber(stack) and tonumber(stack) > 1 and GridIndicatorSideIcons.db.profile.enableIconStackText then
				self.frame[indicator.."StackText"]:SetText(stack)
			else
				self.frame[indicator.."StackText"]:SetText("")
			end

			self.frame[indicator.."BG"]:Show()
			self.frame[indicator]:Show()

		else
			self.frame[indicator.."BG"]:Hide()
		end
	end
end

function GridIndicatorSideIconsFrameClass.prototype:ClearIndicator(indicator)
	GridIndicatorSideIconsFrameClass.super.prototype.ClearIndicator(self, indicator)
	if indicator == "icontop"
	or indicator == "iconbottom"
	or indicator == "iconleft"
	or indicator == "iconright"
	then
		if self.frame[indicator] then

			self.frame[indicator]:SetTexture(1,1,1,0)
			self.frame[indicator.."Text"]:SetText("")
			self.frame[indicator.."Text"]:SetTextColor(1, 1, 1, 1)
			self.frame[indicator.."BG"]:Hide()
			self.frame[indicator.."StackText"]:SetText("")
			self.frame[indicator.."CD"]:Hide()

		end
	end
end

function GridIndicatorSideIconsFrameClass.prototype:SetIconSize(size, borderSize)
	GridIndicatorSideIconsFrameClass.super.prototype.SetIconSize(self, GridFrame.db.profile.iconSize, GridFrame.db.profile.iconBorderSize)
	local f = self.frame
	local xoffsetTB = GridIndicatorSideIcons.db.profile.xoffsetTB
	local yoffsetTB = GridIndicatorSideIcons.db.profile.yoffsetTB
	local xoffsetLR = GridIndicatorSideIcons.db.profile.xoffsetLR
	local yoffsetLR = GridIndicatorSideIcons.db.profile.yoffsetLR

	borderSize = GridIndicatorSideIcons.db.profile.iconBorderSize

	if f.icontop then
		size = GridIndicatorSideIcons.db.profile.iconSizeTop

		local backdrop = f.icontopBG:GetBackdrop()

		backdrop.edgeSize = borderSize
		backdrop.insets.left = borderSize
		backdrop.insets.right = borderSize
		backdrop.insets.top = borderSize
		backdrop.insets.bottom = borderSize

		local r, g, b, a = f.icontopBG:GetBackdropBorderColor()

		f.icontopBG:SetBackdrop(backdrop)
		if borderSize == 0 then
			f.icontopBG:SetBackdropBorderColor(0, 0, 0, 0)
		else
			f.icontopBG:SetBackdropBorderColor(r, g, b, a)
		end

		f.icontopBG:SetPoint("TOP", f, "TOP", xoffsetTB, yoffsetTB)
		f.icontopBG:SetWidth(size + borderSize * 2)
		f.icontopBG:SetHeight(size + borderSize * 2)

		f.icontop:SetWidth(size)
		f.icontop:SetHeight(size)
	end
	if f.iconbottom then
		size = GridIndicatorSideIcons.db.profile.iconSizeBottom

		local backdrop = f.iconbottomBG:GetBackdrop()

		backdrop.edgeSize = borderSize
		backdrop.insets.left = borderSize
		backdrop.insets.right = borderSize
		backdrop.insets.top = borderSize
		backdrop.insets.bottom = borderSize

		local r, g, b, a = f.iconbottomBG:GetBackdropBorderColor()

		f.iconbottomBG:SetBackdrop(backdrop)
		if borderSize == 0 then
			f.iconbottomBG:SetBackdropBorderColor(0, 0, 0, 0)
		else
			f.iconbottomBG:SetBackdropBorderColor(r, g, b, a)
		end

		f.iconbottomBG:SetPoint("BOTTOM", f, "BOTTOM", xoffsetTB, (yoffsetTB*-1))
		f.iconbottomBG:SetWidth(size + borderSize * 2)
		f.iconbottomBG:SetHeight(size + borderSize * 2)

		f.iconbottom:SetWidth(size)
		f.iconbottom:SetHeight(size)
	end
	if f.iconleft then
		size = GridIndicatorSideIcons.db.profile.iconSizeLeft

		local backdrop = f.iconleftBG:GetBackdrop()

		backdrop.edgeSize = borderSize
		backdrop.insets.left = borderSize
		backdrop.insets.right = borderSize
		backdrop.insets.top = borderSize
		backdrop.insets.bottom = borderSize

		local r, g, b, a = f.iconleftBG:GetBackdropBorderColor()

		f.iconleftBG:SetBackdrop(backdrop)
		if borderSize == 0 then
			f.iconleftBG:SetBackdropBorderColor(0, 0, 0, 0)
		else
			f.iconleftBG:SetBackdropBorderColor(r, g, b, a)
		end

		f.iconleftBG:SetPoint("LEFT", f, "LEFT", (xoffsetLR*-1), yoffsetLR)
		f.iconleftBG:SetWidth(size + borderSize * 2)
		f.iconleftBG:SetHeight(size + borderSize * 2)

		f.iconleft:SetWidth(size)
		f.iconleft:SetHeight(size)
	end
	if f.iconright then
		size = GridIndicatorSideIcons.db.profile.iconSizeRight

		local backdrop = f.iconrightBG:GetBackdrop()

		backdrop.edgeSize = borderSize
		backdrop.insets.left = borderSize
		backdrop.insets.right = borderSize
		backdrop.insets.top = borderSize
		backdrop.insets.bottom = borderSize

		local r, g, b, a = f.iconrightBG:GetBackdropBorderColor()

		f.iconrightBG:SetBackdrop(backdrop)
		if borderSize == 0 then
			f.iconrightBG:SetBackdropBorderColor(0, 0, 0, 0)
		else
			f.iconrightBG:SetBackdropBorderColor(r, g, b, a)
		end

		f.iconrightBG:SetPoint("RIGHT", f, "RIGHT", xoffsetLR, yoffsetLR)
		f.iconrightBG:SetWidth(size + borderSize * 2)
		f.iconrightBG:SetHeight(size + borderSize * 2)

		f.iconright:SetWidth(size)
		f.iconright:SetHeight(size)
	end
end