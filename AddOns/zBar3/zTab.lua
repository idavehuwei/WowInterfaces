local _G = getfenv(0)

zTab = {}

--[[ Tab functions ]]

function zTab:SavePosition(tab)
    local x, y = tab:GetCenter()
    local cx, cy = UIParent:GetCenter()
    cx = cx / tab:GetScale()
    cy = cy / tab:GetScale()
    zBar3Data[tab.bar:GetName()].pos = {"CENTER",x-cx,y-cy,}
    tab:SetUserPlaced(false)
    -- save my corteges' positions
    if tab.cortege then
        for _, name in ipairs(tab.cortege) do
            zTab:SavePosition(_G[name])
        end
    end
end

-- drag start
function zTab:OnDragStart(self)
    self:StartMoving()

    if InCombatLockdown() then return end

    for key, name in pairs(zBar3.buttons) do
        if not _G[name]:GetAttribute("statehidden")
            and _G[name]:GetParent():GetID() <= 10 then
            _G[name]:Show()
            _G[name.."NormalTexture"]:SetVertexColor(1.0, 1.0, 1.0, 0.5)
        end
    end

    if zCastBar then zCastBar:SetShowTexture(true) end
end

-- darg stop
function zTab:OnDragStop(self)
    self:StopMovingOrSizing()

    zTab:SavePosition(self)
    if self.master then -- remove self from master tab's cortege list
        tDeleteItem(self.master.cortege, self:GetName())
        self.master = nil
    end

    if InCombatLockdown() then return end

    if zCastBar then zCastBar:SetShowTexture(false) end

    local attachPoint = nil
    if IsControlKeyDown() then
        attachPoint = "BOTTOMLEFT"
    elseif IsShiftKeyDown() then
        attachPoint = "TOPRIGHT"
    end
        -- check if drop on a button
    for key, name in pairs(zBar3.buttons) do
        local button = _G[name]
        if attachPoint then
            if button and self.bar ~= button:GetParent() and
            button:IsVisible() and MouseIsOver(button) then

                local offsetX, offsetY = button:GetParent():GetChildSizeAdjust(attachPoint)
                offsetX = offsetX / self.bar:GetScale()
                offsetY = offsetY / self.bar:GetScale()

                self:ClearAllPoints()
                self:SetPoint("BOTTOMLEFT", button, attachPoint, offsetX, offsetY)
                zTab:SavePosition(self)

                -- master and cortege
                local tab = _G[name]:GetParent():GetTab()
                self.master = tab
                tab.cortege = tab.cortege or {}
                table.insert(tab.cortege, self:GetName())

                attachPoint = nil -- done, i'm already stick one
            end
        end
        -- update self button
        if button:GetParent():GetID() <= 10 and button.action then
            if (zBar3.showgrid == 0 and not HasAction(button.action)) then
                button:Hide()
            end
        end
    end
end

--[[ Tab for Free Style ]]

function zTab:GetFreeTab()
    if zFreeTab then return zFreeTab end
    local tab = CreateFrame("Frame","zFreeTab",UIParent)
    tab:SetBackdrop( {
        bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true, tileSize = 16, edgeSize = 16,
        insets = { left = 5, right = 5, top = 5, bottom = 5 }
    });
    tab:SetBackdropColor(0.2,0.2,0.2)
    tab:EnableMouse(true)
    tab:EnableMouseWheel(true)
    tab:SetScript("OnMouseDown", zTab.FreeOnDragStart)
    tab:SetScript("OnMouseUp", zTab.FreeOnDragStop)
    tab:SetScript("OnMouseWheel", zTab.FreeOnWheel)
    tab:SetScript("OnLeave", zTab.FreeOnLeave)
    return tab
end

-- called by zBarOption, when free style is selected
function zTab:SaveAllPoints(bar)
    for i = 2, zBar3Data[bar:GetName()].num do
        zTab:SaveFreePosition(_G[zBar3.buttons[bar:GetName()..i]])
    end
end

function zTab:SaveFreePosition(button)
    local button = button or zTab:GetFreeTab().button
    local target = _G[zBar3.buttons[button:GetParent():GetName().."1"]]

    if button == target then return end

    local x,y = button:GetCenter()
    local x1, y1 = target:GetCenter()
    x = x - x1 / button:GetScale()
    y = y - y1 / button:GetScale()

    local saves = zBar3Data[button:GetParent():GetName()]
    if not saves.buttons then saves.buttons = {} end
    if not saves.buttons[button:GetName()] then
        saves.buttons[button:GetName()] = {}
    end
    saves.buttons[button:GetName()].pos = {x, y,}

    button:SetUserPlaced(false)
    button:ClearAllPoints()
    button:SetPoint("CENTER", target, "CENTER", x, y)
end

function zTab:FreeOnDragStart()
    local button = zTab:GetFreeTab().button
    local bar = button:GetParent()

    if zBar3Data[bar:GetName()].num > 1
        and button:GetName() ~= zBar3.buttons[bar:GetName()..1] then
        button:StartMoving()
    end
end

function zTab:FreeOnDragStop()
    zTab:GetFreeTab().button:StopMovingOrSizing()
    zTab:SaveFreePosition()
end

function zTab:FreeOnWheel()
    local target = zTab:GetFreeTab().button
    local scale = target:GetScale() + arg1/10

    if target:GetName() == zBar3.buttons[target:GetParent():GetName()..1] then
        target = target:GetParent()
        scale = target:GetScale() + arg1/10
        if scale > 1.8 then scale = 1.8 end
        zBar3Data[target:GetName()].scale = scale
        target:GetTab():SetScale(scale)
        target:SetScale(scale)
        return
    end

    local saves = zBar3Data[target:GetParent():GetName()]
    if not saves.buttons then saves.buttons = {} end
    if not saves.buttons[target:GetName()] then
        saves.buttons[target:GetName()] = {}
    end
    saves.buttons[target:GetName()].scale = scale

    target:SetScale(scale)
    zTab:SaveFreePosition()
end

function zTab:FreeOnEnter(self)
    if InCombatLockdown() then return end
    local bar = self:GetParent()
    if zBar3Data[bar:GetName()].layout == "free" and
        IsControlKeyDown() and IsAltKeyDown() and IsShiftKeyDown() then
        local tab = zTab:GetFreeTab()
        tab:SetAllPoints(self)
        tab:SetFrameLevel(self:GetFrameLevel() + 5)
        tab.button = self
        tab:Show()

        return true
    end
end

function zTab:FreeOnLeave(self)
    local tab = zTab:GetFreeTab()
    tab.button:StopMovingOrSizing()
    zTab:SaveFreePosition()
    tab:SetFrameLevel(0)
    tab.button = nil
    tab:Hide()
end