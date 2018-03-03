--[[
How do you use this bugger? simple!

local f = tekDebug:GetFrame("MyAddon")
This gets you a ScrollingMessageFrame to output debuggery into.  You can call f:AddMessage() directly if you like, pass it off to your Debug lib, whatever.

In my addons this is what I do...
Force tD to load before your addon if present
## OptionalDeps: tekDebug

Then make a Debug function (note, this version is NOT nil-safe)

local debugf = tekDebug and tekDebug:GetFrame("MyAddon")
local function Debug(...) if debugf then debugf:AddMessage(string.join(", ", ...)) end end

Or, if you use Dongle:

MyAddon = DongleStub("Dongle-1.0"):New("MyAddon")
if tekDebug then MyAddon:EnableDebug(1, tekDebug:GetFrame("MyAddon")) end
]]


local frames, names, refresh = {}, {}
local panel = LibStub("tekPanel-Auction").new("tekDebugPanel", "tekDebug", true)
tekDebug = {}


panel:SetScript("OnShow", function(self)
    local buttons, offset = {}, 0

    local function OnClick(self)
        if not self.scrollframe then return end

        local frame = self.scrollframe
        if frame:IsVisible() then
            frame:Hide()
            self:UnlockHighlight()
        else
            for _, f in pairs(frames) do f:Hide() end
            for _, f in pairs(buttons) do f:UnlockHighlight() end

            frame:SetParent(panel)
            frame:ClearAllPoints()
            frame:SetPoint("TOPLEFT", 190, -103)
            frame:SetWidth(630) frame:SetHeight(305)
            frame:SetFrameStrata("DIALOG")
            frame:Show()

            self:LockHighlight()
        end
    end

    local function OnMouseWheel(self, v)
        if v > 0 then -- up
            offset = math.max(offset - 1, 0)
            --refresh()
        else -- down
            offset = math.max(math.min(offset + 1, #names - 15), 0)
            --refresh()
        end
    end

    function refresh()
        for i = 1, 15 do
            local frame, name = buttons[i], names[i + offset]
            if name then
                frame.text:SetText(name)
                frame.scrollframe = frames[name]
                if frames[name]:IsVisible() then frame:LockHighlight() else frame:UnlockHighlight() end
                frame:Show()
            else
                frame:Hide()
            end
        end
    end

    for i = 1, 15 do
        local button = CreateFrame("Button", nil, panel)
        button:SetWidth(158) button:SetHeight(20)
        if i == 1 then button:SetPoint("TOPLEFT", self, 23, -105) else button:SetPoint("TOP", buttons[i - 1], "BOTTOM", 0, 0) end

        button:SetHighlightFontObject(GameFontHighlightSmall)
        button:SetNormalFontObject(GameFontNormalSmall)

        button:SetNormalTexture("Interface\\AuctionFrame\\UI-AuctionFrame-FilterBG")
        button:GetNormalTexture():SetTexCoord(0, 0.53125, 0, 0.625)

        button:SetHighlightTexture("Interface\\PaperDollInfoFrame\\UI-Character-Tab-Highlight")
        button:GetHighlightTexture():SetBlendMode("ADD")

        button.text = button:CreateFontString(nil, "OVERLAY", "GameFontWhite")
        button.text:SetText("Test")
        button.text:SetPoint("LEFT", button, 10, 0)
        button.text:SetPoint("RIGHT", button, -10, 0)
        button.text:SetJustifyH("LEFT")

        button:EnableMouseWheel()
        button:SetScript("OnMouseWheel", OnMouseWheel)
        button:SetScript("OnClick", OnClick)

        buttons[i] = button
    end

    refresh()
    self:SetScript("OnShow", nil)
end)


local function OnMouseWheel(frame, delta)
    if delta > 0 then
        if IsShiftKeyDown() then
            frame:ScrollToTop()
        else
            frame:ScrollUp()
        end
    elseif delta < 0 then
        if IsShiftKeyDown() then
            frame:ScrollToBottom()
        else
            frame:ScrollDown()
        end
    end
end


function tekDebug:GetFrame(name)
    if frames[name] then return frames[name] end

    local f = CreateFrame("ScrollingMessageFrame", nil, UIParent)
    f:SetMaxLines(250)
    f:SetFontObject(ChatFontSmall)
    f:SetJustifyH("LEFT")
    f:SetFading(false)
    f:EnableMouseWheel(true)
    f:SetScript("OnMouseWheel", OnMouseWheel)
    f:SetScript("OnHide", f.ScrollToBottom)
    f:Hide()

    local clear = CreateFrame("Button", nil, f, "UIPanelCloseButton")
    clear:SetNormalTexture("Interface\\Buttons\\CancelButton-Up")
    clear:SetPushedTexture("Interface\\Buttons\\CancelButton-Down")
    clear:SetHighlightTexture("Interface\\Buttons\\CancelButton-Highlight")
    clear:SetPoint("TOPRIGHT", 0, 0)
    clear:SetScript("OnClick", function() f:Clear(); end)

    local orig = f.AddMessage
    f.AddMessage = function(self, txt, ...)
        local newtext = txt:gsub(name .. "|r:", date("%X") .. "|r", 1)
        return orig(self, newtext, ...)
    end

    frames[name] = f
    table.insert(names, name)
    table.sort(names)
    if refresh then refresh() end

    return f
end


-----------------------------
-- Slash Handler      --
-----------------------------

SLASH_TEKDEBUG1 = "/td"
SLASH_TEKDEBUG2 = "/tekdebug"
function SlashCmdList.TEKDEBUG() ShowUIPanel(panel) end


----------------------------------------
-- Quicklaunch registration      --
----------------------------------------

local ldb = LibStub and LibStub:GetLibrary("LibDataBroker-1.1", true)
if ldb then
    ldb:NewDataObject("tekDebug", {
        type = "launcher",
        icon = "Interface\\Icons\\Spell_Shadow_CarrionSwarm",
        OnClick = SlashCmdList.TEKDEBUG,
    })
end
