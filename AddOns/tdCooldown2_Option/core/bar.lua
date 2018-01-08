
local tCD = tdCooldown2;
if not tCD.methods.barloaded then return end
local L = TDCOOLDOWN2_OPTION_LACALE

local bars = tCD.bars;
local db = tCD.db;
local option = tCD.option;
local frame, panel, button;
local mode = select(3, GameFontHighlightSmall:GetFont());
local cfont;
--local tdDropdown = IsAddOnLoaded("!tdDropdown");

local function UpdateBars()
	local bar, p, r, y
	if db.bar.reverse then
		p = "BOTTOMLEFT"; r = "TOPLEFT"; y = db.bar.spacing
	else
		p = "TOPLEFT"; r = "BOTTOMLEFT"; y = - db.bar.spacing
	end
	if db.bar.locked then
		bars[0]:Hide();
	else
		bars[0]:Show();
	end
	
	for i, bar in ipairs(bars) do
		if db.bar.hidden then
			bar:Hide();
		end
		bar:SetAlpha(db.bar.alpha);
		bar:SetWidth(db.bar.width);
		bar:SetHeight(db.bar.height);
		bar.name:SetWidth(db.bar.width);
		bar.name:SetHeight(db.bar.height);
		bar.name:SetFont(db.bar.font, db.bar.size, mode);
		bar.timer:SetFont(db.bar.font, db.bar.size, mode);
		bar.icon:SetWidth(db.bar.height);
		bar.icon:SetHeight(db.bar.height);
		bar:ClearAllPoints();
		bar:SetPoint(p, bars[i - 1], r, 0, y);
	end

	tCD:TestAllCooling()
end

local function UpdateCenter()
	tCD:UpdateCenterStyle(option.move);
	if option.move then
		option.move.text:SetText(tCD:FormatCenterText(L["Spell"]));
	end
	tCD:UpdateCenterStyle(tCD.center);
end

frame = option:CreateOptions(L["Bar and Center"]);

panel = option:CreatePanel(frame, L["All"], true, "TOPLEFT:TOPLEFT:10:-20|BOTTOMRIGHT:TOPRIGHT:-10:-95");

option:CreateCheckButton(panel, L["Enable"], "bar", "config", function(self)
	tCD:ToggleCenter(self:GetChecked() and true or nil);
	if not self:GetChecked() then
		tCDcoolingData = {};
		tCD:UpdateBar();
	end
end);
option:CreateCheckButton(panel, L["Sound"], "bar", "sound");
option:CreateEditBox(panel, L["Min Displayable Cooldown Duration"], "bar", "min", nil, true, function(value) return value < 2 and 2 or value end);

panel = option:CreatePanel(frame, L["Bar"], nil, "TOPLEFT:TOPLEFT:10:-110|BOTTOMRIGHT:BOTTOM:-5:5");

option:CreateCheckButton(panel, L["Hide Bar"], "bar", "hidden", UpdateBars);
option:CreateCheckButton(panel, L["Locked"], "bar", "locked", UpdateBars);
option:CreateCheckButton(panel, L["Reserve sort"], "bar", "reverse", UpdateBars);
option:CreateSlider(panel, L["Width"], "bar", "width", UpdateBars, 50, 200, 1);
option:CreateSlider(panel, L["Height"], "bar", "height", UpdateBars, 10, 50, 1);
option:CreateSlider(panel, L["Spacing"], "bar", "spacing", UpdateBars, 0, 50, 1);
option:CreateSlider(panel, L["Alpha"], "bar", "alpha", UpdateBars, 0, 1, 0.05);
option:CreateSlider(panel, L["Font Size"], "bar", "size", UpdateBars, 5, 40, 1);
cfont = option:CreateEditBox(panel, L["Font"], "bar", "font", UpdateBars, nil, nil, function(value) return tCD:TestFont(value) end);
--if tdDropdown then tdCreateDropDown({name = cfont:GetName(), profile = "tdCooldown2Font", short = true}) end

button = CreateFrame("Button", nil, panel, "UIPanelButtonTemplate");
button:SetWidth(80); button:SetHeight(20);
button:SetText(L["Test"]);
button:SetPoint("TOPRIGHT", 0, 18);
button:SetScript("OnClick", function(self)
	tCD:CreateTestBar()
end)

panel = option:CreatePanel(frame, L["Center Icon"], nil, "TOPLEFT:TOP:5:-110|BOTTOMRIGHT:BOTTOMRIGHT:-10:5");

option:CreateCheckButton(panel, L["Enable"], "center", "config");
option:CreateCheckButton(panel, L["Highlight HoT Icon"], "center", "mode", UpdateCenter);
option:CreateCheckButton(panel, L["Text in center"], "center", "text", UpdateCenter);
option:CreateColor(panel, L["Color of spell name"], "center", UpdateCenter);
option:CreateSlider(panel, L["Alpha"], "center", "alpha", UpdateCenter, 0, 1, 0.05);
option:CreateSlider(panel, L["Width"], "center", "width", UpdateCenter, 50, 300, 1);
option:CreateSlider(panel, L["Duration"], "center", "time", nil, 0.3, 3, 0.05);
option:CreateSlider(panel, L["Font Size"], "center", "size", UpdateCenter, 10, 36, 1);
option:CreateDropdown(panel, L["Shining Texture"], "center", "style", UpdateCenter, {
	{value = 1, text = DEFAULT},
	{value = 2, text = L["Only Icon"]},
	{value = 3, text = L["Icon no Border"]},
});
cfont = option:CreateEditBox(panel, L["Font"], "center", "font", UpdateCenter, nil, nil, function(value) return tCD:TestFont(value) end);
--if tdDropdown then tdCreateDropDown({name = cfont:GetName(), profile = "tdCooldown2Font", short = true}) end

button = CreateFrame("Button", nil, panel, "UIPanelButtonTemplate");
button:SetWidth(80); button:SetHeight(20);
button:SetText(L["Effect Test (on|off)"]);
button:SetPoint("TOPRIGHT", 0, 18);
button:SetScript("OnClick", function(self)
	if option.move and option.move:IsVisible() then
		option.move:Hide()
	else
		if not option.move then
			local move = CreateFrame("Frame", nil, self:GetParent());
			move:SetClampedToScreen(true); move:EnableMouse(true);
			move:SetToplevel(true); move:SetMovable(true);
			move:RegisterForDrag("LeftButton");
			move:SetFrameLevel(self:GetParent():GetFrameLevel() + 1000);
			move:SetScript("OnDragStart",function(self) self:StartMoving() end)
			move:SetScript("OnDragStop",function(self)
				self:StopMovingOrSizing();
				local p,_,r,x,y = self:GetPoint();
				db.center.position.p = p;
				db.center.position.r = r;
				db.center.position.x = x;
				db.center.position.y = y;
				if tCD.center then
					tCD.center:SetPoint(p, UIParent, r, x, y);
				end
			end)
			
			move.icon = move:CreateTexture(nil,"ARTWORK");
			move.icon:SetTexture("Interface\\Icons\\Spell_Holy_SealOfMight");
			
			move.text = move:CreateFontString(nil, "OVERLAY");
			move.text:SetPoint("TOP", move, "BOTTOM");
			move.text:Show();
			tCD:UpdateCenterStyle(move);
			
			option.move = move;
			move.text:SetText(tCD:FormatCenterText(L["Spell"]));
		end
		option.move:Show();
	end
end)

