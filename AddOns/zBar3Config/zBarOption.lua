local _G = getfenv(0)

CreateFrame("Frame", "zBarOption", UIParent)
zBar3:AddPlugin(zBarOption)

--[[ functional ]]
function zBarOption:Load()
	self:SetWidth(350); self:SetHeight(415);
	self:SetPoint("CENTER")
	self:SetMovable(true)
	self:SetToplevel(true)
	self:SetFrameStrata("DIALOG")
	self:SetClampedToScreen(true)
end

function zBarOption:Openfor(bar)
	if InCombatLockdown() then
		UIErrorsFrame:AddMessage("zBar3Option: DO NOT SETUP IN COMBAT !!!",1.0,0.1,0.1,1.0)
		return
	end
	self:CheckReady()
	self:Select(bar)
	self:LoadOptions()
	self:Show()
end

function zBarOption:GetSelected()
	if not self.bar then zBar3:print("Nothing selected") end
	return self.bar
end

--[[ Privates ]]
function zBarOption:CheckReady()
	-- run once
	if self.ready then return true end
	self.ready = true

	--[[ Create at first time ]]

	-- background
	self:SetBackdrop( {
		bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
		tile = true, tileSize = 16, edgeSize = 16,
		insets = { left = 5, right = 5, top = 5, bottom = 5 }
	});
	self:SetBackdropColor(0,0,0)
	self:SetBackdropBorderColor(0.5,0.5,0.5)

	-- drag
	self:EnableMouse(true)
	self:RegisterForDrag("LeftButton")
	self:SetScript("OnDragStart",function() this:StartMoving() end)
	self:SetScript("OnDragStop",function() this:StopMovingOrSizing() end)

	-- label texts
	local name, args, label
	for name, args in pairs(self.labels) do
		label = self:CreateFontString(self:GetName()..name,"ARTWORK",args[1])
		label:SetTextColor(args[2],args[3],args[4])
		label:SetPoint(args[5],args[6],args[7])
		label:SetText(zBar3.loc.Option[name])
	end

	-- close button
	CreateFrame("Button","zBarOptionCloseButton",self,"UIPanelCloseButton"):SetPoint("TOPRIGHT")

	-- choose bar
	local id, bar, button
	for id, name in ipairs(self.bars) do
		bar = _G[name]

		button = CreateFrame("CheckButton", "zBarOptionBar"..name,self,"zBarOptionRadioButtonTemplate")
		button.bar = bar

		if not bar or not bar.Reset then
			button:Disable()
			button:SetTextColor(0.5,0.5,0.5)
		end

		button:SetText(zBar3.loc.Labels[name])
		button:SaveTextColor()

		if id == 1 then
			button:SetPoint("TOPLEFT",zBarOptionSelectBar,"BOTTOMLEFT",0,-5)
		elseif mod(id, 4) == 1 then
			button:SetPoint("TOP","zBarOptionBar"..self.bars[id-4],"BOTTOM")
		else
			button:SetPoint("LEFT","zBarOptionBar"..self.bars[id-1],"RIGHT",62,0)
		end

		button:SetScript("OnClick", function()
			PlaySound("igMainMenuOptionCheckBoxOn")
			zBarOption:Openfor(this.bar)
		end)
	end

	-- reset button
	button = CreateFrame("Button","zBarOptionResetButton",self,"UIPanelButtonTemplate2")
	button:SetWidth(110); button:SetHeight(20);
	button:SetPoint("TOPRIGHT","zBarOption","TOPRIGHT",-20,-140)
	button:SetText(zBar3.loc.Option.Reset)
	button:SetScript("OnClick", function() zBarOption.bar:Reset(true) zBarOption:LoadOptions() end)

	-- check buttons
	for id, value in ipairs(self.buttons) do
		local template
		if value.radio then
			template = "zBarOptionRadioButtonTemplate"
		else
			template = "zBarOptionCheckButtonTemplate"
		end
		button = CreateFrame("CheckButton","zBarOption"..value.name,zBarOption, template)
		button:SetPoint(value.pos[1],value.pos[2],value.pos[3],value.pos[4],value.pos[5])

		if value.notReady or (value.IsEnabled and not value.IsEnabled()) then
			button:Disable()
			button:SetTextColor(0.5,0.5,0.5)
		end

		button:SetText(zBar3.loc.Option[value.name])
		button:SaveTextColor()
		button.tooltipText = zBar3.loc.Tips[value.name]
		button:SetID(id)

		button:SetScript("OnClick",function()
			PlaySound("igMainMenuOptionCheckBoxOn")
			local value = zBarOption.buttons[this:GetID()]
			local checked = this:GetChecked()
			-- save the option value
			if value.common then
				zBar3Data[value.var] = checked
			elseif value.var then
				if value.value and checked then
					checked = value.value
				end
				zBar3Data[zBarOption.bar:GetName()][value.var] = checked
			end
			if checked then
				value.OnChecked()
			else
				value.UnChecked()
			end
		end)

	end

	-- sliders
	local slider, value
	for id, value in ipairs(zBarOption.sliders) do
		slider = CreateFrame("Slider", "zBarOptionSlider"..id, zBarOption, "OptionsSliderTemplate")
		slider:SetPoint(value.pos[1],value.pos[2],value.pos[3],value.pos[4],value.pos[5])
		slider:SetMinMaxValues(value.min,value.max)
		slider:SetValueStep(value.step)
		slider:SetScript("OnValueChanged", value.setFunc)

		slider.text = _G["zBarOptionSlider"..id.."Text"]
		slider.text:SetText(zBar3.loc.Option[value.name])
		slider.tooltipText = zBar3.loc.Tips[value.name]

		if value.factor then
			_G["zBarOptionSlider"..id.."Low"]:SetText(value.min * value.factor .. "%")
			_G["zBarOptionSlider"..id.."High"]:SetText(value.max * value.factor .. "%")
		else
			_G["zBarOptionSlider"..id.."Low"]:SetText(value.min)
			_G["zBarOptionSlider"..id.."High"]:SetText(value.max)
		end
	end
	-- edit box for scale input
	CreateFrame("EditBox","zBarOptionSlider3EditBox",zBarOptionSlider3,"InputBoxTemplate")
	zBarOptionSlider3EditBox:SetWidth(30) zBarOptionSlider3EditBox:SetHeight(20)
	zBarOptionSlider3EditBox:SetAutoFocus(true)
	zBarOptionSlider3EditBox:SetNumeric(true)
	zBarOptionSlider3EditBox:SetMaxLetters(3)
	zBarOptionSlider3EditBox:SetFocus(true)
	zBarOptionSlider3EditBox:SetPoint("LEFT",zBarOptionSlider3Text,"RIGHT",6,0)
	
	zBarOptionSlider3EditBox:SetScript("OnEnterPressed", function()
		zBarOptionSlider3:SetValue(this:GetNumber()*0.01)
	end)
	zBarOptionSlider3EditBox:SetScript("OnEscapePressed", function()
		zBarOption:Hide()
	end)

	zBarOptionSlider3EditBox:CreateFontString("zBarOptionSlider3EditBoxText","ARTWORK","GameFontNormalSmall")
	zBarOptionSlider3EditBoxText:SetText('%')
	zBarOptionSlider3EditBoxText:SetPoint("LEFT",zBarOptionSlider3EditBox,"RIGHT")
end

function zBarOption:LoadOptions()
	self.loading = 1
	local id, value, obj
	-- read check buttons value
	for id, value in ipairs(zBarOption.buttons) do
		obj = _G["zBarOption"..value.name]
		if value.IsChecked then -- system attributes
			obj:SetChecked(value.IsChecked())
		elseif value.var then
			if value.common then -- common attributes
				obj:SetChecked(zBar3Data[value.var])
			elseif value.value then
				obj:SetChecked(zBar3Data[zBarOption.bar:GetName()][value.var] == value.value)
			else -- bar attributes
				obj:SetChecked(zBar3Data[zBarOption.bar:GetName()][value.var])
			end
		end
	end
	-- read sliders value
	local min = 1
	local max = zBar3Data[self.bar:GetName()].max or 12
	local num = zBar3Data[zBarOption.bar:GetName()].num or 1
	local linenum = zBar3Data[zBarOption.bar:GetName()].linenum or 1
	if max == 0 then min = 0 end
	zBarOptionSlider1:SetMinMaxValues(min,max)
	zBarOptionSlider1:SetValue(num)
	zBarOptionSlider1High:SetText(max)
	zBarOptionSlider2:SetMinMaxValues(min,max)
	zBarOptionSlider2:SetValue(linenum)
	zBarOptionSlider2High:SetText(max)
	for id, value in ipairs(zBarOption.sliders) do
		obj = _G["zBarOptionSlider"..id]
		obj:SetValue(zBar3Data[zBarOption.bar:GetName()][value.var] or 1)
	end
	self.loading = nil
end

function zBarOption:Select(bar)
	local id, name, button
	for id, name in pairs(self.bars) do
		button = _G["zBarOptionBar"..name]
		if button:GetChecked() then
			button:SetChecked(false)
			button:SetTextColor(1.0, 0.82, 0)
			button:SaveTextColor()
		end
	end
	button = _G["zBarOptionBar"..bar:GetName()]
	button:SetChecked(true)
	button:SetTextColor(0.1, 1.0, 0.1)
	button:SaveTextColor()

	self.bar = bar
end

--[[ utilities ]]

function zBarOption:Befor_ShowGrid()
 	if InCombatLockdown() then return end
	for name,bar in pairs(zBar3.bars) do
		if bar:GetID() >= 5 and bar:GetID() <= 8 then
			for i=1,12 do
				local button = _G[zBar3.buttons[name..i]]
				button:SetAttribute("showgrid", button:GetAttribute("showgrid") + 1)
			end
		end
	end
end
function zBarOption:Befor_HideGrid()
 	if InCombatLockdown() then return end
	for name,bar in pairs(zBar3.bars) do
		if bar:GetID() >= 5 and bar:GetID() <= 8 then
			for i=1,12 do
				local button = _G[zBar3.buttons[name..i]]
				local showgrid = button:GetAttribute("showgrid")
				if showgrid > 0 then
					button:SetAttribute("showgrid", showgrid - 1)
				end
			end
		end
	end
end


--[[ Datas ]]
zBarOption.labels = {
	-- font, color-red, color-green, color-blue, pos, offset-x, offset-y
	["Title"] = {"GameFontNormalLarge",0.12,0.66,1,"TOP",0,-10},
	["SelectBar"] = {"GameFontNormalLarge",1.0,0.7,0.1,"TOPLEFT",10,-30},
	["Attribute"] = {"GameFontNormalLarge",1.0,0.7,0.1,"TOPLEFT",10,-135},
	["Layout"] = {"GameFontNormalLarge",1.0,0.7,0.1,"TOPLEFT",120,-135},
	["InCombat"] = {"GameFontNormalLarge",1.0,0.7,0.1,"TOPLEFT",10,-243},
	["Commons"] = {"GameFontNormalLarge",1.0,0.7,0.1,"TOPLEFT",10,-280},
}
zBarOption.bars = { --[[ bar name and order ]]
	"zMultiBL", "zMultiBR", "zMultiR2", "zMultiR1",
	"zMainBar", "zPetBar", "zStanceBar", "zBagBar",
	"zMicroBar", "zXPBar", "zCastBar", "zPossessBar",
	"zExBar1", "zShadow1", "zExBar2", "zShadow2",
	"zExBar3", "zShadow3", "zExBar4", "zShadow4",
}
zBarOption.buttons = { --[[ Check Buttons - for attribute setting ]]
	{-- switch full/lite mode
		name="FullMode",var='fullmode',common=true,
		pos={'TOPRIGHT','zBarOption','TOPRIGHT',-88,-30},
		OnChecked=ReloadUI,
		UnChecked=ReloadUI,
	},
	{-- show / hide bar
		name="Hide",var="hide",pos={"TOPLEFT","zBarOptionAttribute","BOTTOMLEFT",0,0},
		OnChecked=function() zBarOption.bar:UpdateVisibility() end,
		UnChecked=function()
			zBarOption.bar:UpdateVisibility()
			zBarOption.bar:UpdateButtons()
			zBarOption.bar:UpdateLayouts()
		end,
	},
	{-- show / hide name label
		name="Label",var="label",pos={"TOP","zBarOptionHide","BOTTOM",0,0},
		OnChecked=function() zBarOption.bar:GetLabel():Show() end,
		UnChecked=function() zBarOption.bar:GetLabel():Hide() end,
	},
	{-- show / hide tab
		name="Lock",var="hideTab",pos={"TOP","zBarOptionLabel","BOTTOM",0,0},
		OnChecked=function() zBarOption.bar:UpdateVisibility() end,
		UnChecked=function() zBarOption.bar:UpdateVisibility() end,
	},
	{-- show / hide hotkeys
		name="HotKey",var="hideHotkey",pos={"TOP","zBarOptionLock","BOTTOM",0,0},
		OnChecked=function() zBarOption.bar:UpdateHotkeys() end,
		UnChecked=function() zBarOption.bar:UpdateHotkeys() end,
	},
	{-- auto-pop mode
		name="AutoPop",var="inCombat",value="autoPop",radio = true,
		pos={"TOPLEFT","zBarOptionInCombat","BOTTOMLEFT",0,0},
		OnChecked=function()
			zBarOptionAutoHide:SetChecked(false)
			zBarOption.bar:UpdateAutoPop()
		end,
		UnChecked=function() zBarOption.bar:UpdateAutoPop() end,
	},
	{-- auto-hide mode
		name="AutoHide",var="inCombat",value="autoHide",radio = true,
		pos={"TOPLEFT","zBarOptionInCombat","BOTTOMLEFT",100,0},
		OnChecked=function()
			zBarOptionAutoPop:SetChecked(false)
			zBarOption.bar:UpdateAutoPop()
		end,
		UnChecked=function() zBarOption.bar:UpdateAutoPop() end,
	},
	{
		name="Suite1",var="layout",value="suite1",radio = true,
		pos={"TOPLEFT","zBarOptionLayout","BOTTOMLEFT",0,0},
		OnChecked=function()
			zBarOptionSuite2:SetChecked(false)
			zBarOptionCircle:SetChecked(false)
			zBarOptionFree:SetChecked(false)
			zBarOption.bar:UpdateLayouts()
		end,
		UnChecked=function() zBarOptionSlider2:SetValue(2) zBarOptionSlider2:SetValue(1) end,
	},
	{
		name="Suite2",var="layout",value="suite2",radio = true,
		pos={"TOP","zBarOptionSuite1","BOTTOM",0,-2},
		OnChecked=function()
			zBarOptionSuite1:SetChecked(false)
			zBarOptionCircle:SetChecked(false)
			zBarOptionFree:SetChecked(false)
			zBarOption.bar:UpdateLayouts()
		end,
		UnChecked=function() zBarOptionSlider2:SetValue(2) zBarOptionSlider2:SetValue(1) end,
	},
	{
		name="Circle",var="layout",value="circle",radio = true,
		pos={"TOP","zBarOptionSuite2","BOTTOM",0,-2},
		OnChecked=function()
			zBarOptionSuite1:SetChecked(false)
			zBarOptionSuite2:SetChecked(false)
			zBarOptionFree:SetChecked(false)
			zBarOption.bar:UpdateLayouts()
		end,
		UnChecked=function() zBarOptionSlider2:SetValue(2) zBarOptionSlider2:SetValue(1) end,
	},
	{
		name="Free",var="layout",value="free",radio = true,
		pos={"TOP","zBarOptionCircle","BOTTOM",0,-2},
		OnChecked=function()
			zBarOptionSuite1:SetChecked(false)
			zBarOptionSuite2:SetChecked(false)
			zBarOptionCircle:SetChecked(false)
			if not zBar3.buttons[zBarOption.bar:GetName().."1"] then return end
			local saves = zBar3Data[zBarOption.bar:GetName()]
			for i = 1, saves.num do
				local button = _G[zBar3.buttons[zBarOption.bar:GetName()..i]]
				if not button:IsMovable() then
					button:SetMovable(true)
				end
			end
			zTab:SaveAllPoints(zBarOption.bar)
		end,
		UnChecked=function() zBarOptionSlider2:SetValue(2) zBarOptionSlider2:SetValue(1) end,
	},
	{
		name="Invert",var="invert",
		pos={"TOP","zBarOptionFree","BOTTOM",0,-2},
		OnChecked=function() zBarOption.bar:UpdateLayouts() end,
		UnChecked=function() zBarOption.bar:UpdateLayouts() end,
	},
	--[[ commons ]]
	{-- show / hide button tips
		name="HideTip",var="hideTip",common=true,
		pos={"TOPLEFT","zBarOptionCommons","BOTTOMLEFT",0,0},
		OnChecked=function() end,
		UnChecked=function() end,
	},
	{-- lock / unlock all buttons
		name="LockButtons",
		pos={"TOP","zBarOptionHideTip","BOTTOM",0,0},
		IsChecked=function() return LOCK_ACTIONBAR == "1" end,
		OnChecked=function() LOCK_ACTIONBAR = "1" SetCVar("lockActionBars", "1") end,
		UnChecked=function() LOCK_ACTIONBAR = nil SetCVar("lockActionBars", nil) end,
	},
	{-- show / hide grid
		name="HideGrid",
		pos={"TOP","zBarOptionLockButtons","BOTTOM",0,0},
		IsChecked=function()
			return not (ALWAYS_SHOW_MULTIBARS == "1" or ALWAYS_SHOW_MULTIBARS == 1)
		end,
		OnChecked=function()
			ALWAYS_SHOW_MULTIBARS = nil
			SetCVar("alwaysShowActionBars", nil)
			zBarOption:Befor_HideGrid()
			MultiActionBar_UpdateGridVisibility()
		end,
		UnChecked=function()
			ALWAYS_SHOW_MULTIBARS = "1"
			SetCVar("alwaysShowActionBars", "1")
			zBarOption:Befor_ShowGrid()
			MultiActionBar_UpdateGridVisibility()
		end,
	},
	{-- auto page
		name="PageTrigger",var="pageTrigger",common=true,
		pos={"TOP","zBarOptionHideGrid","BOTTOM",0,0},
		IsEnabled=function() return (zMainBar and true) end,
		OnChecked=function() zMainBar:UpdateStateHeader() end,
		UnChecked=function() zMainBar:UpdateStateHeader() end,
	},
	{-- Duid cat form, page change when stealth
		name="CatStealth",var="catStealth",common=true,
		pos={"TOP","zBarOptionPageTrigger","BOTTOM",0,0},
		IsEnabled=function() return (zMainBar and zBar3.class == "DRUID") end,
		OnChecked=function() zMainBar:UpdateStateHeader() end,
		UnChecked=function() zMainBar:UpdateStateHeader() end,
	},
}
zBarOption.sliders = { --[[ Sliders ]]
	[1] = {-- num of buttons
		name="Num",
		var="num", min=1, max=12, step=1,
		pos={"TOPRIGHT","zBarOption","TOPRIGHT",-10,-185},
		setFunc = function()
			zBar3Data[zBarOption.bar:GetName()].num = this:GetValue()
			zBarOption.bar:UpdateButtons()
			zBarOption.bar:UpdateLayouts()
		end
	},
	[2] = {-- num per line
		name="NumPerLine",
		var="linenum", min=1, max=12, step=1,
		pos={"TOP","zBarOptionSlider1","BOTTOM",0,-25},
		setFunc = function()
			local saves = zBar3Data[zBarOption.bar:GetName()]

			if zBarOption.loading and saves.layout ~= "line" then return end

			-- uncheck layout radio buttons
			zBarOptionSuite1:SetChecked(false)
			zBarOptionSuite2:SetChecked(false)
			zBarOptionCircle:SetChecked(false)
			zBarOptionFree:SetChecked(false)

			-- linenum can't be greater than num
			local num = this:GetValue()
			if num > saves.num then
				this:SetValue(saves.num)
				return -- return to prevent dead loop
			end
			-- update
			saves.layout = "line"
			saves.linenum = this:GetValue()
			zBarOption.bar:UpdateLayouts()
		end
	},
	[3] = {-- scale
		name="Scale",
		var="scale", min=0.2, max=1.8, step=0.001, factor=100,
		pos={"TOP","zBarOptionSlider2","BOTTOM",0,-30},
		setFunc = function()
			local value = this:GetValue()
			zBar3Data[zBarOption.bar:GetName()].scale = value
			zBarOption.bar:SetScale(value)
			zBarOption.bar:GetTab():SetScale(value)
			-- set edit box text
			local tmp = _G[this:GetName().."EditBox"]
			tmp:SetText(floor(100 * value))
			tmp:HighlightText()
		end
	},
	[4] = {-- button spacing
		name="Inset",
		var="inset", min=-10, max=30, step=1,
		pos={"TOP","zBarOptionSlider3","BOTTOM",0,-25},
		setFunc = function(self)
			zBar3Data[zBarOption.bar:GetName()].inset = this:GetValue()
			zBarOption.bar:UpdateLayouts()
			self.text:SetText(zBar3.loc.Option.Inset.." |cff00FF00"..self:GetValue().."|r")
		end
	},
	[5] = {-- alpha
		name="Alpha",
		var="alpha", min=0, max = 1, step=0.1, factor=100,
		pos={"TOP","zBarOptionSlider4","BOTTOM",0,-25},
		setFunc = function()
			zBar3Data[zBarOption.bar:GetName()].alpha = this:GetValue()
			zBarOption.bar:SetAlpha(this:GetValue())
		end
	},
}