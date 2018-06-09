--[[
    JPack_Ex: A button on you bag frame!
    orig by zyleon@sohu.com
    yaroot#gmail _dot_ com
]]
-- 保存创建的button
local buttons = {};
local L = {};
if (GetLocale() == "zhCN") then
    L['Click'] = '点击'
    L['Pack'] = '整理'
    L['LClick'] = '鼠标左键 正序整理'
    L['RClick'] = '鼠标右键 逆序整理'

    L['Alt + Left-Click'] = 'Alt + 左键'
    L['Packup guildbank'] = '整理公会银行'
    L['Shift + Left-Click'] = 'Shift + 左键'
    L['Save to the bank'] = '保存到银行'
    L['Ctrl + Left-Click'] = 'Ctrl + 左键'
    L['Load from the bank'] = '从银行取出'
    L['Shift + Right-Click'] = 'Shift + 右键'
    L['Set sequence to ascend'] = '正序整理'
    L['Ctrl + Right-Click'] = 'Ctrl + 右键'
    L['Set sequence to descend'] = '逆序整理'
elseif (GetLocale() == "zhTW") then
    L['Click'] = '點擊'
    L['Pack'] = '整理'
    L['LClick'] = '鼠标左键 正序整理'
    L['RClick'] = '鼠标右键 逆序整理'

    L['Alt + Left-Click'] = 'Alt + 左鍵'
    L['Packup guildbank'] = '整理公會銀行'
    L['Shift + Left-Click'] = 'Shift + 左鍵'
    L['Save to the bank'] = '保存到銀行'
    L['Ctrl + Left-Click'] = 'Ctrl + 左鍵'
    L['Load from the bank'] = '從銀行取出'
    L['Shift + Right-Click'] = 'Shift + 右鍵'
    L['Set sequence to ascend'] = '正序整理'
    L['Ctrl + Right-Click'] = 'Ctrl + 右鍵'
    L['Set sequence to descend'] = '逆序整理'
else
    L = {
        ['Click'] = 'Click',
        ['Pack'] = 'Pack',
        ['LClick'] = 'Left-Click ascend',
        ['RClick'] = 'Right-Click descend',
        ['Alt + Left-Click'] = 'Alt + Left-Click',
        ['Packup guildbank'] = 'Packup guildbank',
        ['Shift + Left-Click'] = 'Shift + Right-Click',
        ['Save to the bank'] = 'Save to the bank',
        ['Ctrl + Left-Click'] = 'Ctrl + Right-Click',
        ['Load from the bank'] = 'Load from the bank',
        ['Shift + Right-Click'] = 'Shift + Left-Click',
        ['Set sequence to ascend'] = 'Set sequence to ascend',
        ['Ctrl + Right-Click'] = 'Ctrl + Left-Click',
        ['Set sequence to descend'] = 'Set sequence to descend',
    }
end


local function OnClick(self, button)
    local access = nil;

    if self.packType == "guildbank" then
        access = 3
    end
    if (access) then
        JPack:Pack(access);

        return;
    end
    if (self:GetName() == "OneBankFrameSort") then
        JPack.bankOpened = true;
    else
        JPack.bankOpened = false;
    end

    if (button == "RightButton") then
        --print("RightButton");
        --JPack:Pack(access,1)
        --JPack.bankOpened
        JPack_Order("asc");
        JPack:pack(nil);
    end
    if (button == "LeftButton") then
        --print("LeftButton")
        --JPack:Pack(access,2);
        JPack_Order("");
        JPack:pack(nil);
    end
end

local function OnEnter(self)
    GameTooltip:SetOwner(self, 'ANCHOR_RIGHT')
    --GameTooltip:AddDoubleLine(L['Click'], L['Pack'], 0, 1, 0, 0, 1, 0)
    GameTooltip:AddLine(L['Pack'], 1, 1, 1);
    GameTooltip:AddLine(L['LClick']);
    GameTooltip:AddLine(L['RClick']);
    if JPack.DEV_MOD then GameTooltip:AddDoubleLine(L['Alt + Left-Click'], L['Packup guildbank'], 0, 1, 0, 0, 1, 0) end
    GameTooltip:Show()
end

local function OnLeave()
    GameTooltip:Hide()
end

function BuildButton(parent, width, height, point1, point2, point3)
    local f = CreateFrame('Button', parent:GetName() .. "Sort", parent, 'UIPanelButtonTemplate')

    f:SetWidth(width)
    f:SetHeight(height)
    f:SetPoint(point1, point2, point3)
    f:SetText(L['Pack'])
    f:SetScript('OnMouseUP', OnClick)

    f:SetScript('OnEnter', OnEnter)
    f:SetScript('OnLeave', OnLeave)
    table.insert(buttons, f);

    return f
end

local function ADDON_LOADED(self, event, addon)
    if addon ~= 'Blizzard_GuildBankUI' then return end
    button = BuildButton(GuildBankFrame, 80, 26, 'TOPRIGHT', -25, -15)
    button.packType = "guildbank"
    self:UnregisterEvent('ADDON_LOADED', ADDON_LOADED)
end

local function onLoad()
    JPack:UnregisterEvent('PLAYER_LOGIN', onLoad)
    local button;
    if IsAddOnLoaded('ArkInventory') then
        local i = 1
        while i do
            local arkframe = _G['ARKINV_Frame' .. i]
            if not arkframe then break end
            button = BuildButton(arkframe, 50, 25, 'TOPRIGHT', -135, -15)
            button.packType = "bag"
            i = i + 1
        end
        return

    elseif IsAddOnLoaded('Baggins') then
        button = BuildButton(BagginsBag1, 45, 20, 'TOPRIGHT', -30, -6)
        button.packType = "bag"
        button = BuildButton(BagginsBag12, 45, 20, 'TOPRIGHT', -30, -6)
        button.packType = "bag"
    elseif IsAddOnLoaded('BaudBag') then
        button = BuildButton(BBCont1_1, 45, 20, 'TOPRIGHT', -40, 20)
        button.packType = "bag"
        button = BuildButton(BBCont2_1, 45, 20, 'TOPRIGHT', -40, 20)
        button.packType = "bag"
    elseif IsAddOnLoaded('Combuctor') then
        --CombuctorFrame1Search:SetPoint('TOPRIGHT',-166,-44)
        CombuctorFrame2Search:SetPoint('TOPRIGHT', -166, -44)
        button = BuildButton(CombuctorFrame1, 45, 25, 'TOPRIGHT', -50, -40)
        button.packType = "bag"
        button = BuildButton(CombuctorFrame2, 45, 25, 'TOPRIGHT', -50, -40)
        button.packType = "bag"
    elseif IsAddOnLoaded('MyInventory') then
        button = BuildButton(MyInventoryFrame, 80, 26, 'TOPRIGHT', -15, -35)
        button.packType = "bag"
        button = BuildButton(MyBankFrame, 80, 26, 'TOPRIGHT', -15, -35)
        button.packType = "bag"
    elseif IsAddOnLoaded('OneBag') or IsAddOnLoaded('OneBag3') then
        button = BuildButton(OneBagFrame, 60, 20, 'TOPRIGHT', -105, -11)
        button.packType = "bag"
        if IsAddOnLoaded('OneBank') or IsAddOnLoaded('OneBank3') then
            button = BuildButton(OneBankFrame, 60, 20, 'TOPRIGHT', -105, -11)
            button.packType = "bag"
        end
    else
        button = BuildButton(ContainerFrame1, 45, 20, 'TOPRIGHT', -10, -28)
        button.packType = "bag"
        button = BuildButton(BankFrame, 45, 20, 'TOPRIGHT', -50, -15)
        button.packType = "bag"
    end

    if JPack.DEV_MOD then JPack:RegisterEvent('ADDON_LOADED', ADDON_LOADED) end
end

JPack:RegisterEvent('PLAYER_LOGIN', onLoad)

function JPack_Toggle(switch)
    for i, b in ipairs(buttons) do
        if (switch) then
            b:Show();
        else
            b:Hide();
        end
    end
end
