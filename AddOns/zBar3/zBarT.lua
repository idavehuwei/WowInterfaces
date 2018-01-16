local _G = getfenv(0)
--[[
    Functions for Derivates
--]]

-- template for common functions of bars
zBarT = CreateFrame("Frame",nil,UIParent,"SecureHandlerStateTemplate")

--[[ reset profile, scale, position to DEFAULT for any bar ]]
function zBarT:Reset(resetsaves)

    local db = zBar3Data
    local name = self:GetName()

    -- reset profile
    if resetsaves or not db[name] then
        db[name] = zBar3:GetDefault(self,"saves")
        db[name].pos = zBar3:GetDefault(self,"pos")
    end
    -- reset scale
    self:SetScale(db[name]["scale"] or 1)
    self:GetTab():SetScale(self:GetScale())
    -- reset alpha
    self:SetAlpha(db[name].alpha or 1)
    -- name plate
    if db[name].label then self:GetLabel():Show() end

    -- remove tab from master tab's cortege list
    if self:GetTab().master then
        tDeleteItem(self:GetTab().master.cortege, self:GetTab():GetName())
        self:GetTab().master = nil
    end
    -- remove tab's corteges
    if self:GetTab().cortege then
        for n, name in ipairs(self:GetTab().cortege) do
            _G[name]:ClearAllPoints()
            table.remove(self:GetTab().cortege, n)
            _G[name].master = nil
        end
    end

    -- reset position
    local pos = db[name].pos or zBar3:GetDefault(self, "pos")
    self:GetTab():ClearAllPoints()
    if type(pos[2]) == "string" then
        self:GetTab():SetPoint(pos[1],UIParent,pos[2],pos[3],pos[4])
    else
        self:GetTab():SetPoint(pos[1],UIParent,pos[1],pos[2],pos[3])
    end
    self:ClearAllPoints()
    self:SetPoint("TOP",self:GetTab(),"BOTTOM",0,0)

    -- update all
    self:UpdateVisibility()
    self:UpdateButtons()
    self:UpdateLayouts()
    self:UpdateHotkeys()
    self:UpdateAutoPop()
end

function zBarT:UpdateVisibility()
    if zBar3Data[self:GetName()].hide then
        self:Hide()
        if self:GetID()<15 then
            self:SetAttribute('collapsed', true)
        end
    else
        self:Show()
        if self:GetID()<15 then
            self:SetAttribute('collapsed', nil)
        end
    end
    if zBar3Data[self:GetName()].hideTab then
        self:GetTab():Hide()
    else
        self:GetTab():Show()
    end
end

function zBarT:UpdateAutoPop()
    local db = zBar3Data[self:GetName()]
    if db.hide then return end

    UnregisterStateDriver(self, "visibility")
    if not db.inCombat then
        self:Show()
    else
        if "autoPop" == db.inCombat then
            RegisterStateDriver(self, "visibility", "[combat][harm,nodead]show;hide")
        elseif "autoHide" == db.inCombat then
            RegisterStateDriver(self, "visibility", "[combat][harm,nodead]hide;show")
        end
    end
end

--[[ update buttons, hide unwanted buttons ]]
function zBarT:UpdateButtons()
    local button
    local db = zBar3Data[self:GetName()]

    if db.max == 0 then return end

    for i = 1, self:GetNumButtons() do
        button = self:GetButton(i)
        assert(button)
        if i <= (db.num or 1) then
            if _G[button:GetName().."AutoCast"] then
                if PetActionBarFrame.showgrid > 0 or GetPetActionInfo(i) then
                    button:Show()
                end
            elseif not button.action
            or (button:GetAttribute("showgrid") > 0 or HasAction(button.action)) then
                button:Show()
            end
            button:SetAttribute("statehidden", nil)
        else
            button:Hide()
            button:SetAttribute("statehidden", true)
        end
    end
end

--[[ enable / disable hotkey text shown for bar ]]
function zBarT:UpdateHotkeys()
    local hotkey

    for i = 1 , self:GetNumButtons() do
        hotkey = _G[ (zBar3.buttons[self:GetName()..i] or "?? ").."HotKey"]
        if hotkey then
            if zBar3Data[self:GetName()].hideHotkey then
                hotkey:Hide()
                hotkey.zShow = hotkey.Show
                hotkey.Show = zBar3.NOOP
            elseif hotkey.zShow then
                hotkey.Show = hotkey.zShow
                if hotkey:GetText() ~= RANGE_INDICATOR then
                    hotkey:Show()
                end
            end
        end
    end
end

function zBarT:UpdateGrid()
    -- in combat we can't let it be shown or hidden
    if InCombatLockdown() then return end
    for i=1, self:GetNumButtons() do
        local button = self:GetButton(i)
        button:SetAttribute("showgrid", zBar3.showgrid)
        if zBar3.showgrid > 0 then
            if not button:GetAttribute("statehidden") then
                button:Show();
                _G[button:GetName().."NormalTexture"]:SetVertexColor(1.0, 1.0, 1.0, 0.5)
            end
        elseif not HasAction(button.action) then
            button:Hide();
        end
    end
end

--[[ get localized bar name as label ]]
function zBarT:GetLabel()
    local label = _G[self:GetName().."Label"]

    if not label then
        label = self:GetTab():CreateFontString(self:GetName().."Label", "ARTWORK", "GameFontGreen")
        label:SetPoint("BOTTOM", self:GetTab(), "TOP", 0, 0)
        label:SetText( zBar3.loc.Labels[self:GetName()] or self:GetName() )
        label:Hide()
    end

    return label
end

function zBarT:GetButton(id)
    return _G[zBar3.buttons[self:GetName()..id]]
end

function zBarT:GetNumButtons()
    return zBar3Data[self:GetName()].max or NUM_ACTIONBAR_BUTTONS
end

-- overwrite this if needed
function zBarT:GetChildSizeAdjust(attachPoint)
    return 0, 0
end

-- get tab of bar, create if not exist
function zBarT:GetTab()
    local id = self:GetID()
    local tab = _G["zTab"..id]
    if tab then return tab end

    tab = CreateFrame("Button", "zTab"..id, UIParent, "zBarTabTemplate")
    tab:SetID(id)
    tab.bar = self
    tab:SetWidth(self:GetWidth())
    tab:SetScale(self:GetScale())
    tab:SetFrameLevel(self:GetFrameLevel() + 5)

    tab:RegisterForDrag("LeftButton")
    tab:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    tab:SetScript("OnDragStart", function(self) zTab:OnDragStart(self) end)
    tab:SetScript("OnDragStop", function(self) zTab:OnDragStop(self) end)

    tab:SetFrameRef('bar', self)
    tab:SetAttribute('label', self:GetLabel())
    tab.OnMenu = function(self, unit, button)
        zBar3:Config(this.bar)
    end

    -- collapse and expand
    tab:SetAttribute("_onclick", [[
        local bar = self:GetFrameRef('bar')
        if button == 'RightButton' then
            control:CallMethod('OnMenu')
            control:CallMethod('ShowLabel', nil)
        elseif button == 'LeftButton' then
            if bar:GetAttribute('collapsed') then
                bar:Show()
                bar:SetAttribute('collapsed', nil)
            elseif bar:IsShown() then
                bar:Hide()
                bar:SetAttribute('collapsed', true)
            end
        end
    ]])

    tab.ShowLabel = function(self, show)
        if show then UIFrameFadeIn(self.bar:GetLabel(), 0.2, 0, 1)
        else UIFrameFadeOut(self.bar:GetLabel(), 1, 1, 0) end
    end

    tab:SetAttribute("_onenter", [[
        local bar = self:GetFrameRef('bar')
        if bar:GetAttribute('collapsed') then bar:Show() bar:SetAttribute('state-expand',1) end
        control:CallMethod('ShowLabel', true)
    ]])
    tab:SetAttribute("_onleave", [[control:CallMethod('ShowLabel', false)]])

    return tab
end

-- hover to expand
function zBarT:InitHoverHandler()
    if self:GetID()>14 then return end -- not a handler

    self:SetAttribute('_ontimer', [[
        if self:GetAttribute('collapsed') and not self:GetAttribute('temp-expand') then
            self:Hide()
        end
    ]])
    self:SetAttribute('_onstate-expand', [[
        control:SetTimer(1, true)
    ]])

    for i,button in ipairs({self:GetChildren()}) do
        self:WrapScript(button, 'OnEnter', [[
            bar = self:GetParent()
            if bar:GetAttribute('collapsed') then
                bar:SetAttribute('temp-expand',1)
            end
        ]])
        self:WrapScript(button, 'OnLeave', [[
            bar = self:GetParent()
            if bar:GetAttribute('collapsed') then
                bar:SetAttribute('temp-expand',nil)
                bar:SetAttribute('state-expand',1)
            end
        ]])
    end
end