zCastBar = CreateFrame("Frame", "zCastBar", UIParent)
zBar3:AddPlugin(zCastBar)
zBar3:AddBar(zCastBar)

function zCastBar:Load()
    self:SetID(16)
    self:SetWidth(34)
    self:SetHeight(13)

    -- positon of CastingBarFrame and FramerateLabel
    CastingBarFrame:SetParent(self)
    CastingBarFrame:ClearAllPoints()
    CastingBarFrame:SetPoint("TOP",zCastBar,0,-5)
    FramerateLabel:SetParent(self)
    FramerateLabel:ClearAllPoints()
    FramerateLabel:SetPoint("BOTTOM",self:GetLabel(),"TOP")

    -- skin
    CastingBarFrameBorder:SetTexture("Interface\\CastingBar\\UI-CastingBar-Border-Small")
    CastingBarFrameFlash:SetTexture("Interface\\CastingBar\\UI-CastingBar-Flash-Small")

    -- icon
    CastingBarFrameIcon:Show()
    CastingBarFrameIcon:SetWidth(24)
    CastingBarFrameIcon:SetHeight(24)
    CastingBarFrameIcon:SetPoint("RIGHT",CastingBarFrame,"LEFT",-5,2)

    -- text
    CastingBarFrameText:ClearAllPoints()
    CastingBarFrameText:SetPoint("CENTER",0,3)

    -- texture
    local kids = {CastingBarFrame:GetRegions()}
    for k, v in pairs(kids) do
        if not v:GetName() then
            v:ClearAllPoints()
            v:SetPoint("TOPLEFT",0,2)
            v:SetPoint("TOPRIGHT",0,2)
            v:SetPoint("BOTTOMLEFT",0,2)
            v:SetPoint("BOTTOMRIGHT",0,2)
        end
    end

    self:Hook()
end

function zCastBar:Hook()
    CastingBarFrame.ClearAllPoints = zBar3.NOOP
    CastingBarFrame.SetPoint = zBar3.NOOP
    FramerateLabel.ClearAllPoints = zBar3.NOOP
    FramerateLabel.SetPoint = zBar3.NOOP
end

function zCastBar:UpdateButtons()
    if zBar3Data["zCastBar"].num > 1 then
        CastingBarFrameIcon:Show()
    else
        CastingBarFrameIcon:Hide()
    end
end

function zCastBar:UpdateLayouts()
    CastingBarFrameIcon:ClearAllPoints()
    if zBar3Data["zCastBar"].invert then
        CastingBarFrameIcon:SetPoint("LEFT",CastingBarFrame,"RIGHT",5,2)
    else
        CastingBarFrameIcon:SetPoint("RIGHT",CastingBarFrame,"LEFT",-5,2)
    end
end

function zCastBar:SetShowTexture(show)
    if show then
        CastingBarFrame.fadeOut = nil
        CastingBarFrame:Show()
        CastingBarFrame:SetAlpha(1)
    else
        CastingBarFrame:Hide()
    end
end