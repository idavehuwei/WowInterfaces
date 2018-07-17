-- BuyEmAll - Originally created and developed by Cogwheel up to version 2.8.4, now developed by Shinisuryu.
BuyEmAll = {}

local L = BUYEMALL_LOCALS

-- These are used for the text on the Max and Stack buttons. See BuyEmAll.xml.
BUYEMALL_MAX = L.MAX
BUYEMALL_STACK = L.STACK

--[[
It's ALIVE!!! Muahahahahhahahaa!!!!!!
]]
function BuyEmAll:OnLoad()
    -- Set up confirmation dialog
    StaticPopupDialogs["BUYEMALL_CONFIRM"] = {
        text = L.CONFIRM,
        button1 = YES,
        button2 = NO,
        OnAccept = function(dialog) self:DoPurchase(dialog.data) end,
        timeout = 0,
        hideOnEscape = true,
    }

    self.OrigMerchantItemButton_OnModifiedClick = MerchantItemButton_OnModifiedClick
    MerchantItemButton_OnModifiedClick = function(...)
        self:MerchantItemButton_OnModifiedClick(this, ...)
    end

    self.OrigMerchantFrame_OnHide = MerchantFrame:GetScript("OnHide")
    MerchantFrame:SetScript("OnHide", function(...)
        return self:MerchantFrame_OnHide(...)
    end)
end

function BuyEmAll:MoneyFrame_OnLoad(frame)
    -- Set up money frame
    MoneyTypeInfo["BUYEMALL"] = {
        UpdateFunc = function() return 0 end, -- Stub to satisfy MoneyFrame_SetType
        showSmallerCoins = "Backpack",
        fixedWidth = 1,
        collapse = 1,
    }
    BuyEmAllMoneyFrame.small = 1
    MoneyFrame_SetType(frame, "BUYEMALL")
end

--[[
Makes sure the BuyEmAll frame goes away when you leave a vendor
]]
function BuyEmAll:MerchantFrame_OnHide(...)
    BuyEmAllFrame:Hide()
    return self.OrigMerchantFrame_OnHide(...)
end

--[[
Hooks left-clicks on merchant item buttons
]]
function BuyEmAll:MerchantItemButton_OnModifiedClick(frame, button, ...)
    if MerchantFrame.selectedTab == 1
       and IsShiftKeyDown()
       and not IsControlKeyDown()
       and not (ChatFrameEditBox and ChatFrameEditBox:IsVisible() and button == "LeftButton") then

        -- Set up various data before showing the BuyEmAll frame
        self.itemIndex = frame:GetID()

        local name, texture, price, quantity, numAvailable =
            GetMerchantItemInfo(self.itemIndex)
        self.preset = quantity
        self.price = price
        self.itemName = name
        self.available = numAvailable

        local bagMax, specialMax, stack =
            CogsFreeBagSpace(tonumber(strmatch(GetMerchantItemLink(self.itemIndex), "item:(%d+):")))
        self.stack = stack
        self.fit = floor(bagMax / quantity) * quantity + specialMax
        self.afford = floor(GetMoney() / price) * quantity
        self.max = min(self.fit, self.afford)
        if numAvailable > -1 then
            self.max = min(self.max, numAvailable * quantity)
        end
        if self.max == 0 or not name then
            return
        elseif self.max == 1 then
            MerchantItemButton_OnClick("LeftButton", 1)
            return
        end

        specialMax = floor(specialMax / quantity) * quantity
        self.defaultStack =
            specialMax > 0 and specialMax <= self.max and specialMax or quantity
        self.split = self.defaultStack

        self.partialFit = self.fit % stack
        self:SetStackClick()

        self:Show(frame)
    else
        self.OrigMerchantItemButton_OnModifiedClick(frame, button, ...)
    end
end

--[[
Prepare the various UI elements of the BuyEmAll frame and show it
]]
function BuyEmAll:Show(frame)
    self.typing = 0
    BuyEmAllLeftButton:Disable()
    BuyEmAllRightButton:Enable()

    BuyEmAllStackButton:Enable()
    if self.max < self.stackClick then
        BuyEmAllStackButton:Disable()
    end

    BuyEmAllFrame:ClearAllPoints()
    BuyEmAllFrame:SetPoint("BOTTOMLEFT", frame, "TOPLEFT", 0, 0)

    BuyEmAllFrame:Show(frame)
    self:UpdateDisplay()
end

--[[
If the amount is more than stack and defaultStack, show a confirmation.
Otherwise, do the purchase
]]
function BuyEmAll:VerifyPurchase(amount)
    amount = amount or self.split
    if (amount > 0) then
        amount = ceil(amount/self.preset) * self.preset
        if amount > self.stack and amount > self.defaultStack then
            self:DoConfirmation(amount)
        else
            self:DoPurchase(amount)
        end
    end
end

--[[
Makes the actual purchase(s)
amount must be a multiple of the preset stack size if preset stack size > 1
]]
function BuyEmAll:DoPurchase(amount)
    BuyEmAllFrame:Hide()

    local numLoops, purchAmount, leftover

    if self.preset > 1 then
        numLoops = amount/self.preset
        purchAmount = 1
        leftover = 0
    else
        numLoops = floor(amount/self.stack)
        purchAmount = self.stack
        leftover = amount % self.stack
    end

    for i = 1, numLoops do
        BuyMerchantItem(self.itemIndex, purchAmount)
    end

    if leftover > 0 then BuyMerchantItem(self.itemIndex, leftover) end
end

--[[
Changes the money display to however much amount of the item will cost. If
amount is not specified, it uses the current split value.
]]
function BuyEmAll:UpdateDisplay()
    local purchase = ceil(self.split / self.preset)
    local cost = purchase * self.price
    MoneyFrame_Update("BuyEmAllMoneyFrame", cost)
    BuyEmAllText:SetText(self.split)

    BuyEmAllLeftButton:Enable()
    BuyEmAllRightButton:Enable()
    if self.split == self.max then
        BuyEmAllRightButton:Disable()
    elseif self.split <= self.preset then
        BuyEmAllLeftButton:Disable()
    end

    self:SetStackClick()
    BuyEmAllStackButton:Enable()
    if self.max < self.stackClick then
        BuyEmAllStackButton:Disable()
    end
end

--[[
Shows the confirmation dialog
]]
function BuyEmAll:DoConfirmation(amount)
    local dialog = StaticPopup_Show("BUYEMALL_CONFIRM", amount, self.itemName)
    dialog.data = amount
end

--[[
Calculates the amount that the Stack button will enter
]]
function BuyEmAll:SetStackClick()
    local increase = (self.partialFit == 0 and self.stack or self.partialFit) - (self.split % self.stack)
    self.stackClick = self.split + (increase == 0 and self.stack or increase)
end

--[[
OnClick handler for the four main buttons
]]
function BuyEmAll:OnClick(frame)
    if frame == BuyEmAllOkayButton then
        self:VerifyPurchase()
    elseif frame == BuyEmAllCancelButton then
        BuyEmAllFrame:Hide()
    elseif frame == BuyEmAllStackButton then
        self.split = self.stackClick
        self:UpdateDisplay()
        if frame:IsEnabled() == 1 then
            self:OnEnter(frame)
        else
            GameTooltip:Hide()
        end
    elseif frame == BuyEmAllMaxButton then
        self.split = self.max
        self:UpdateDisplay()
    end
end

--[[
Allows you to type a number to buy. This is adapted directly from the Default
UI's code.
]]
function BuyEmAll:OnChar(text)
    if text < "0" or text > "9" then
        return
    end

    if self.typing == 0 then
        self.typing = 1
        self.split = 0
    end

    local split = (self.split * 10) + text
    if split == self.split then
        if self.split == 0 then
            self.split = 1
        end

        self:UpdateDisplay()
        return
    end

    if split <= self.max then
        self.split = split
    elseif split == 0 then
        self.split = 1
    end
    self:UpdateDisplay()
end

--[[
Key handler for keys other than 0-9
]]
function BuyEmAll:OnKeyDown(key)
    if key == "BACKSPACE" or key == "DELETE" then
        if self.typing == 0 or self.split == 1 then
            return
        end

        self.split = floor(self.split / 10)
        if self.split <= 1 then
            self.split = 1
            self.typing = 0
        end

        self:UpdateDisplay()
    elseif key == "ENTER" then
        self:VerifyPurchase()
    elseif key == "ESCAPE" then
        BuyEmAllFrame:Hide()
    elseif key == "LEFT" or key == "DOWN" then
        BuyEmAll:Left_Click()
    elseif key == "RIGHT" or key == "UP" then
        BuyEmAll:Right_Click()
    end
end

--[[
Decreases the amount by however much is necessary to go down to the next
lowest multiple of the preset stack size.
]]
function BuyEmAll:Left_Click()
    if self.split <= self.preset then
        return
    end

    local decrease = self.split % self.preset
    decrease = decrease == 0 and self.preset or decrease

    self.split = self.split - decrease

    self:UpdateDisplay()
end

--[[
Increases the amount by however much is necessary to go up to the next highest
multiple of the preset stack size.
]]
function BuyEmAll:Right_Click()
    local increase = self.preset - (self.split % self.preset)

    if self.split + increase > self.max then
        return
    end

    self.split = self.split + increase

    self:UpdateDisplay()
end

--[[
This table is used for the two functions that follow
]]
BuyEmAll.lines = {
    stack = {
        label = L.STACK_PURCH,
        field = "stackClick",
        { label = L.STACK_SIZE, field = "stack" },
        { label = L.PARTIAL, field = "partialFit" },
    },
    max = {
        label = L.MAX_PURCH,
        field = "max",
        { label = L.AFFORD, field = "afford" },
        { label = L.FIT, field = "fit" },
        {
            label = L.AVAILABLE,
            field = "available",
            Hide = function()
                return BuyEmAll.available <= 1
            end
        },
    },
}

--[[
Shows tooltips when you hover over the Stack or Max buttons
]]
function BuyEmAll:OnEnter(frame)
    local lines = self.lines[frame == BuyEmAllMaxButton and "max" or "stack"]

    lines.amount = self[lines.field]
    for i, line in ipairs(lines) do
        line.amount = self[line.field]
    end

    self:CreateTooltip(frame, lines)
end

--[[
Creates the tooltip from the given lines table. See the structure of lines above for
more insight.
]]
function BuyEmAll:CreateTooltip(frame, lines)
    GameTooltip:SetOwner(frame, "ANCHOR_BOTTOMRIGHT")
    GameTooltip:SetText(lines.label.."|cFFFFFFFF - |r"..GREEN_FONT_COLOR_CODE..lines.amount.."|r")

    for _, line in ipairs(lines) do
        if not (line.Hide and line.Hide()) then
            local color = line.amount == lines.amount and GREEN_FONT_COLOR or HIGHLIGHT_FONT_COLOR
            GameTooltip:AddDoubleLine(line.label, line.amount, 1,1,1, color.r,color.g,color.b)
        end
    end

    SetTooltipMoney(GameTooltip, ceil(lines.amount / self.preset) * self.price)

    GameTooltip:Show()
end

--[[
Hides the tooltip
]]
function BuyEmAll:OnLeave()
    GameTooltip:Hide()
    GameTooltip_ClearMoney(GameTooltip)
end

--[[
When the BuyEmAll frame is closed, close any confirmations waiting for a
response.
]]
function BuyEmAll:OnHide()
    StaticPopup_Hide("BUYEMALL_CONFIRM")
end
