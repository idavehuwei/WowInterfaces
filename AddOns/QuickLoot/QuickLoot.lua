if (GetLocale() == "zhCN") then
    QUICK_LOOT_ENABLE = "允许快速拾取物品";
    QUICK_LOOT_AUTOHIDE = "当没有物品时自动隐藏面板"
    MOD_QUICK_LOOT_TITLE = { "快速拾取", "kuaisushiqu" };
elseif (GetLocale() == "zhTW") then
    QUICK_LOOT_ENABLE = "允許快速拾取物品";
    QUICK_LOOT_AUTOHIDE = "當沒有物品時自動隱藏面板"
    MOD_QUICK_LOOT_TITLE = { "快速拾取", "kuaisushiqu" };
else
    QUICK_LOOT_ENABLE = "Enable Quick Loot";
    QUICK_LOOT_AUTOHIDE = "Auto hide if there's nothing inside"
    MOD_QUICK_LOOT_TITLE = "Quick Loot";
end

local lootStartIndex;
local isEnabled;
local isAutoHide;

local isHooked = false;

function QuickLoot_UpdateLootFramePosition()
    local __index;
    local cur_x, cur_y = GetCursorPosition();
    local scale = UIParent:GetScale();
    cur_x = cur_x / scale; cur_y = cur_y / scale;
    LootFrame:ClearAllPoints();

    local index;
    if (lootStartIndex == nil) then
        index = 1;
    else
        index = lootStartIndex + 1;
    end

    for __index = index, LOOTFRAME_NUMBUTTONS, 1 do
        local button = getglobal("LootButton" .. __index);
        if (button:IsVisible()) then
            cur_x = cur_x - 42;
            cur_y = cur_y + 56 + (40 * __index);
            if ((cur_x + 185) > UIParent:GetRight() or (cur_y - 256) < 55) then
                LootFrame:SetPoint("TOPLEFT", "UIParent", "TOPLEFT", 384, -104);
            else
                LootFrame:SetPoint("TOPLEFT", "UIParent", "BOTTOMLEFT", cur_x, cur_y);
            end
            return;
        end
    end

    if (LootFrameDownButton:IsVisible()) then
        cur_x = cur_x - 158;
        cur_y = cur_y + 223;
        lootStartIndex = nil;
    else
        cur_x = cur_x - 173;
        cur_y = cur_y + 25;
    end

    if ((cur_x + 185) > UIParent:GetRight() or (cur_y - 256) < 55) then
        LootFrame:SetPoint("TOPLEFT", "UIParent", "TOPLEFT", 384, -104);
    else
        LootFrame:SetPoint("TOPLEFT", "UIParent", "BOTTOMLEFT", cur_x, cur_y);
    end
end

local function QuickLoot_EventHandler(self, event, ...)
    if (isEnabled) then
        if (event == "LOOT_OPENED") then
            lootStartIndex = nil;
        end
        if (event == "LOOT_SLOT_CLEARED" or event == "LOOT_OPENED") then
            QuickLoot_UpdateLootFramePosition();
        end
        if (isAutoHide == 1) then
            if (event == "LOOT_OPENED") then
                if (GetNumLootItems() == 0) then
                    HideUIPanel(LootFrame);
                end
            end
        end
    end
end

function QuickLoot_LootButton_OnClick(self, button)
    if (isEnabled and lootStartIndex == nil) then
        lootStartIndex = self:GetID();
    end
end

function QuickLoot_OnLoad(self)
    ModManagement_RegisterMod(
        "QuickLoot",
        "Interface\\Icons\\Spell_Nature_UndyingStrength",
        MOD_QUICK_LOOT_TITLE,
        "",
        nil,
        nil, { [5] = true }
    );

    ModManagement_RegisterCheckBox(
        "QuickLoot",
        QUICK_LOOT_ENABLE,
        nil,
        "EnableQuickLoot",
        1,
        function(arg)
            if (arg == 1 and not isEnabled) then
                isEnabled = 1;
                if (not isHooked) then
                    LootFrame:HookScript("OnEvent", QuickLoot_EventHandler);
                    hooksecurefunc("LootButton_OnClick", QuickLoot_LootButton_OnClick);
                    isHooked = true;
                end
            elseif (arg == 0 and isEnabled) then
                isEnabled = nil;
            end
        end
    );

    ModManagement_RegisterCheckBox(
        "QuickLoot",
        QUICK_LOOT_AUTOHIDE,
        nil,
        "QuickLootAutoHide",
        1,
        function(arg)
            isAutoHide = arg;
        end,
        1
    );
end
