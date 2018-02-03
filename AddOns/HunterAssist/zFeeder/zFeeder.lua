
zFeeder = {
    Link = nil,
    Texture = nil,
    Count = nil,
    Item = "",
}

if (GetLocale() == "zhCN") then
    ZFEEDER_MOVE_TOOLTIP = "按住Shift可拖动框体\nShift+右键重置鼠标位置";
elseif (GetLocale() == "zhTW") then
    ZFEEDER_MOVE_TOOLTIP = "按住Shift可拖動框體\nShift+右鍵重置滑鼠位置";
else
    ZFEEDER_MOVE_TOOLTIP = "Hold shift to move frame\nShift + Right click to reset position";
end

local BigFootGather_1e21bf09480ac08a0f6dbe8c4d7f00d1 = false;
local BigFootGather_1ff55ee7265fb9292cb729344dc444e2 = false;
local PetHappinessWarningTime = false;
local PetFeedButtonMoving = nil;
local HidePetHappinessWarning = false;
local PetHappinessThreshold = 2;
local PetHappinessThresholds = {
    [PET_HAPPINESS1] = 2,
    [PET_HAPPINESS2] = 3
};

function ParseItemLink(itemLink)
    if (itemLink) then
        for id, name in string.gmatch(itemLink, "|c%x+|Hitem:(%d+):%-?%d+:%-?%d+:%-?%d+:%-?%d+:%-?%d+:%-?%d+:%-?%d+:%-?%d+|h%[(.+)%]|h|r") do
            return tonumber(id), name;
        end
    end
end

local function zHasFeedEffect()
    local i = 1;
    local name, rank, icon, count, debuffType, duration, expirationTime = UnitAura("pet", i);
    while (icon and duration and expirationTime and duration > 0) do
        local leftTime = expirationTime - GetTime();
        if (string.find(icon, "Ability_Hunter_BeastTraining")) then
            return true, duration, leftTime;
        end
        i = i + 1;
        name, rank, icon, count, debuffType, duration, expirationTime = UnitAura("pet", i);
    end
    return nil
end

local function GetItemSlotInBag(itemLink)
    if (not itemLink) then
        return nil, nil;
    end
    for bagID = 0, NUM_BAG_FRAMES do
        for slotID = 1, GetContainerNumSlots(bagID) do
            local item = GetContainerItemLink(bagID, slotID);
            if (item) then
                local itemID = ParseItemLink(item);
                local zFeederItemID = ParseItemLink(zFeeder.Link);
                if (itemID and zFeederItemID and itemID == zFeederItemID) then
                    return bagID, slotID;
                end
            end
        end
    end
    return nil, nil;
end

local function SetFeedButtonItemTexture(button)
    if (zFeeder.Texture) then
        SetItemButtonTexture(button, zFeeder.Texture);
    end
end

local function SetFeedButtonItemCount(button)
    if (zFeeder.Link) then
        zFeeder.Count = GetItemCount(zFeeder.Link);
        SetItemButtonCount(button, zFeeder.Count);
        if (zFeeder.Count and zFeeder.Count == 0) then
            zFeederButtonIconTexture:SetVertexColor(1.0, 0.1, 0.1);
        else
            zFeederButtonIconTexture:SetVertexColor(1.0, 1.0, 1.0);
        end
    end
end

local zFeederModule = BLibrary("BEvent");
zFeederModule:Init {
    name = "HunterAssist",
    func = function()
        SetFeedButtonItemTexture(getglobal("zFeederButton"));
        SetFeedButtonItemCount(getglobal("zFeederButton"));
        getglobal("zFeederButton"):SetAttribute("unit", "pet");
        getglobal("zFeederButton"):SetAttribute("type", "target");
    end
};

function ZFeed_Toggle(switch)
    if (switch) then
        zFeederModule:RegisterEvent("PLAYER_REGEN_ENABLED");
        zFeederModule:RegisterEvent("BAG_UPDATE");
        if (not HidePetHappinessWarning) then
            hooksecurefunc("PetFrame_SetHappiness", PetFrame_SetHappiness_Hook);
        end
        getglobal("zFeederButton"):Show();
    else
        zFeederModule:UnregisterEvent("PLAYER_REGEN_ENABLED");
        zFeederModule:UnregisterEvent("BAG_UPDATE");
        getglobal("zFeederButton"):Hide();
    end
end

function ZFeed_CHappiness(happiness)
    local happiness = tostring(happiness);
    PetHappinessThreshold = PetHappinessThresholds[happiness] or 2;
end

function zfOnLoad(self)
    self:RegisterForDrag("LeftButton", "RightButton");
    self:RegisterForClicks("LeftButtonUp", "RightButtonUp");
    self.time = 0;
end

function zFeederModule.PLAYER_REGEN_ENABLED()
end

function zFeederModule.BAG_UPDATE()
    SetFeedButtonItemCount(getglobal("zFeederButton"));
end

function zfOnEnter(self)
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
    if (zFeeder.Link) then
        GameTooltip:SetText(ZF_BUTTON_TITLE);
        GameTooltip:AddDoubleLine(ZF_FOODNAME, zFeeder.Link, 1, 1, 1, 1, 1, 1);
        GameTooltip:AddDoubleLine(ZF_FOODQUANTITY, zFeeder.Count, 1, 1, 1, 1, 1, 1);
        GameTooltip:AddLine(ZFEEDER_MOVE_TOOLTIP, 0.5, 0.5, 0.5, 1);
    else
        GameTooltip:AddLine(ZF_NO_FOOD, 1, 1, 1);
        GameTooltip:AddLine(ZFEEDER_MOVE_TOOLTIP, 0.5, 0.5, 0.5, 1);
    end
    GameTooltip:Show();
end

function zfOnLeave(self)
    GameTooltip:Hide();
end

function zfPreClick(self, button)
    if (InCombatLockdown()) then
        return;
    end
    if (CursorHasItem()) then
        local _, info1, info2 = GetCursorInfo();
        local itemTexture = select(10, GetItemInfo(info2));
        if (info1 and info2 and itemTexture) then
            zFeeder.Item = info1;
            zFeeder.Link = info2;
            zFeeder.Texture = itemTexture;
            SetFeedButtonItemTexture(self);
        end
        GameTooltip:Hide();
        ClearCursor();
        SetFeedButtonItemCount(self);
    else
        if (IsShiftKeyDown() and arg1 == "RightButton") then
            zFeederButton:ClearAllPoints();
            zFeederButton:SetPoint("LEFT", "PetFrameHappiness", "RIGHT", 4, 0);
        elseif (zFeeder.Link) then
            local bagID, slotID = GetItemSlotInBag(zFeeder.Link);
            local hasEffect = zHasFeedEffect();
            if (bagID and slotID and not hasEffect) then
                PickupContainerItem(bagID, slotID);
            end
        end
    end
end

function zfOnDragStart(self)
    GameTooltip:Hide();
    if (IsShiftKeyDown()) then
        self:StartMoving();
        PetFeedButtonMoving = true;
        return;
    end
    zFeeder.Link = nil;
    zFeeder.Count = nil;
    zFeeder.Texture = nil;
    zFeeder.Item = "";
    SetItemButtonCount(self, 0);
    SetItemButtonTexture(self, nil);
end

function zfOnDragStop(self)
    if (PetFeedButtonMoving) then
        self:StopMovingOrSizing();
    end
end

function zfOnUpdate(self, elapsed)
    self.time = self.time + elapsed;
    if (self.time > 0.3) then
        local hasEffect, duration, timeleft = zHasFeedEffect();
        if (hasEffect and duration) then
            PetFrameManaBar:SetStatusBarColor(0.0, 1.0, 1.0);
            PetFrameManaBar:SetMinMaxValues(0, duration);
            PetFrameManaBar:SetValue(duration - math.floor(timeleft));
            PetFrameManaBar:UnregisterEvent("UNIT_HAPPINESS");
            self.feeding = true;
        elseif (self.feeding) then
            PetFrameManaBar:RegisterEvent("UNIT_HAPPINESS");
            UnitFrameManaBar_Update(PetFrameManaBar:GetParent());
            self.feeding = false;
        end
        self.time = 0;
    end
end

function PetFrame_SetHappiness_Hook(...)
    local happiness = GetPetHappiness();
    if (happiness and happiness < PetHappinessThreshold) then
        if (not PetHappinessWarningTime or (GetTime() - PetHappinessWarningTime) > 1000) then
            PetHappinessWarningTime = GetTime();
            UIErrorsFrame:AddMessage(ZF_HUNGER, 1.0, 1.0, 0.0, 1.0, UIERRORS_HOLD_TIME);
        end
    else
    end
    BigFootGather_1ff55ee7265fb9292cb729344dc444e2 = false;
end
