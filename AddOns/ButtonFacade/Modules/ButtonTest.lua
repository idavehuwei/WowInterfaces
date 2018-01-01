--[[
    Project.: ButtonFacade
    File....: Modules/ButtonTest.lua
    Version.: 248
    Author..: JJ Sheets, StormFX
]]

-- [ Localization ] --

-- Hard-code enUS/enGB.
local L = {
    ["Button Test"] = "Button Test",
    ["Displays a set of buttons that can be used to verify the functionality of a skin."] = "Displays a set of buttons that can be used to verify the functionality of a skin.",
    ["Enable Module"] = "Enable Module",
    ["Enable this module."] = "Enable this module.",
    ["Enable Drag"] = "Enable Drag",
    ["Enable dragging of the buttons."] = "Enable dragging of the buttons.",
    ["Button Information"] = "Button Information",
    ["BTEST_Info1"] = "In order from left to right, the buttons inherit from the following templates:",
    ["BTEST_Info2"] = "* ActionBarButtonTemplate\n* BonusActionButtonTemplate\n* ShapeshiftButtonTemplate\n* ItemButtonTemplate\n* PetActionButtonTemplate\n* SecureActionButtonTemplate",
}
-- Automatically inject all other locales. Please use the localization application on WoWAce.com to update these.
-- http://www.wowace.com/projects/buttonfacade/localization/namespaces/buttontest/
do
    local LOC = GetLocale()
    if LOC == "deDE" then
-- L["BTEST_Info1"] = "In order from left to right, the buttons inherit from the following templates:"
-- L["BTEST_Info2"] = "* ActionBarButtonTemplate\\n* BonusActionButtonTemplate\\n* ShapeshiftButtonTemplate\\n* ItemButtonTemplate\\n* PetActionButtonTemplate\\n* SecureActionButtonTemplate"
-- L["Button Information"] = "Button Information"
L["Button Test"] = "Symbol-Test"
L["Displays a set of buttons that can be used to verify the functionality of a skin."] = "Zeigt eine Gruppe von Buttons, die benutzt werden können, um die Funktionalität eines Skins zu testen." -- Needs review
L["Enable Drag"] = "Verschieben" -- Needs review
L["Enable dragging of the buttons."] = "Verschieben der Buttons aktivieren."
L["Enable Module"] = "Modul aktivieren" -- Needs review
L["Enable this module."] = "Dieses Modul aktivieren."

    elseif LOC == "esES" or LOC == "esMX" then
-- Use esES until we have a solid esMX localization.
L["BTEST_Info1"] = "En orden de izquierda a derecha, los botones heredan desde las siguientes plantillas:"
L["BTEST_Info2"] = "* ActionBarButtonTemplate\\n* BonusActionButtonTemplate\\n* ShapeshiftButtonTemplate\\n* ItemButtonTemplate\\n* PetActionButtonTemplate\\n* SecureActionButtonTemplate"
L["Button Information"] = "Información del Botón"
L["Button Test"] = "Prueba de Botones"
L["Displays a set of buttons that can be used to verify the functionality of a skin."] = "Muestra una serie de botones que pueden ser utilizados para verificar la funcionalidad de una textura."
L["Enable Drag"] = "Habilitar arrastre"
L["Enable dragging of the buttons."] = "Habilitar arrastre de los botones."
L["Enable Module"] = "Habilitar Módulo"
L["Enable this module."] = "Habilitar este módulo."

    elseif LOC == "frFR" then
L["BTEST_Info1"] = "Dans l'ordre de gauche à droite, les boutons héritent des templates suivants :"
L["BTEST_Info2"] = "* ActionBarButtonTemplate\\n* BonusActionButtonTemplate\\n* ShapeshiftButtonTemplate\\n* ItemButtonTemplate\\n* PetActionButtonTemplate\\n* SecureActionButtonTemplate"
L["Button Information"] = "Information du bouton"
L["Button Test"] = "Bouton de test"
L["Displays a set of buttons that can be used to verify the functionality of a skin."] = "Affiche un ensemble de boutons qui peuvent être utilisés afin de vérifier le bon fonctionnement d'un skin."
L["Enable Drag"] = "Activer la saisie"
L["Enable dragging of the buttons."] = "Active la possibilité de saisir les boutons."
L["Enable Module"] = "Activer le module"
L["Enable this module."] = "Active ce module."

    elseif LOC == "koKR" then
-- L["BTEST_Info1"] = "In order from left to right, the buttons inherit from the following templates:"
-- L["BTEST_Info2"] = "* ActionBarButtonTemplate\\n* BonusActionButtonTemplate\\n* ShapeshiftButtonTemplate\\n* ItemButtonTemplate\\n* PetActionButtonTemplate\\n* SecureActionButtonTemplate"
-- L["Button Information"] = "Button Information"
L["Button Test"] = "버튼 테스트"
L["Displays a set of buttons that can be used to verify the functionality of a skin."] = "스킨의 기능을 확인하는데 사용할 수 있는 버튼의 설정을 표시합니다. 좌에서 우측순으로, 다음의 템플릿으로부터 버튼이 상속됨: ActionBarButtonTemplate, BonusActionButtonTemplate, ShapeshiftButtonTemplate, ItemButtonTemplate, PetActionButtonTemplate."
L["Enable Drag"] = "드래그"
-- L["Enable dragging of the buttons."] = "Enable dragging of the buttons."
L["Enable Module"] = "모듈 활성화"
-- L["Enable this module."] = "Enable this module."

    elseif LOC == "ruRU" then
-- L["BTEST_Info1"] = "In order from left to right, the buttons inherit from the following templates:"
L["BTEST_Info2"] = "* ActionBarButtonTemplate\\n* BonusActionButtonTemplate\\n* ShapeshiftButtonTemplate\\n* ItemButtonTemplate\\n* PetActionButtonTemplate\\n* SecureActionButtonTemplate"
-- L["Button Information"] = "Button Information"
L["Button Test"] = "Проверка кнопок"
L["Displays a set of buttons that can be used to verify the functionality of a skin."] = "Показывает набор кнопок, чтобы проверить работу скина. В порядке слева направо, кнопки используют следующие настройки: ActionBarButtonTemplate, BonusActionButtonTemplate, ShapeshiftButtonTemplate, ItemButtonTemplate, PetActionButtonTemplate." -- Needs review
L["Enable Drag"] = "Тащить" -- Needs review
L["Enable dragging of the buttons."] = "Включить перемещение кнопок."
L["Enable Module"] = "Включить модуль" -- Needs review
L["Enable this module."] = "Включить этот модуль."

    elseif LOC == "zhCN" then
L["BTEST_Info1"] = "从左至右的顺序，按钮继承以下模板："
L["BTEST_Info2"] = "* ActionBarButtonTemplate\\n* BonusActionButtonTemplate\\n* ShapeshiftButtonTemplate\\n* ItemButtonTemplate\\n* PetActionButtonTemplate\\n* SecureActionButtonTemplate"
L["Button Information"] = "按钮信息"
L["Button Test"] = "按钮测试"
L["Displays a set of buttons that can be used to verify the functionality of a skin."] = "显示一系列按钮用来验证功能的皮肤。"
L["Enable Drag"] = "启用拖拽"
L["Enable dragging of the buttons."] = "启用此按钮拖拽。"
L["Enable Module"] = "启用模块"
L["Enable this module."] = "启用此模块。"

    elseif LOC == "zhTW" then
L["BTEST_Info1"] = "從左至右的順序，按鈕繼承以下模板："
L["BTEST_Info2"] = "* ActionBarButtonTemplate\\n* BonusActionButtonTemplate\\n* ShapeshiftButtonTemplate\\n* ItemButtonTemplate\\n* PetActionButtonTemplate\\n* SecureActionButtonTemplate"
L["Button Information"] = "按鈕訊息"
L["Button Test"] = "按鈕測試"
L["Displays a set of buttons that can be used to verify the functionality of a skin."] = "顯示一系列按鈕用來驗證功能的皮膚。"
L["Enable Drag"] = "拖拽"
L["Enable dragging of the buttons."] = "啟用按鈕拖拽。"
L["Enable Module"] = "啟用模組"
L["Enable this module."] = "啟用此組件。"

    end
end

-- Dependencies
local BF = LibStub("AceAddon-3.0"):GetAddon("ButtonFacade")
local LBF = LibStub("LibButtonFacade")
if not LBF then return end

-- [ Set Up ] --

-- Create the module.
local mod = BF:NewModule("ButtonTest")

-- Locals
local db, dragbar
local buttons = {}

-- [ Options ] --

local options = {
    type = "group",
    name = L["Button Test"],
    args = {
        title = {
            type = "description",
            name = "|cffffcc00"..L["Button Test"].."|r\n",
            order = 1,
        },
        desc = {
            type = "description",
            name = L["Displays a set of buttons that can be used to verify the functionality of a skin."].."\n",
            order = 2,
        },
        enable = {
            type = "toggle",
            name = L["Enable Module"],
            desc = L["Enable this module."],
            get = function() return mod:IsEnabled() end,
            set = function(info, s) BF:ToggleModule("ButtonTest", s) end,
            order = 3,
        },
        drag = {
            type = "toggle",
            name = L["Enable Drag"],
            desc = L["Enable dragging of the buttons."],
            get = function() return db.drag end,
            set = function(info, s)
                db.drag = s
                mod:SetDrag()
            end,
            order = 4,
            disabled = function() return not mod:IsEnabled() end
        },
        info = {
            type = "description",
            name = "\n|cffffcc00"..L["Button Information"].."|r\n",
            order = 5,
        },
        info1 = {
            type = "description",
            name = L["BTEST_Info1"].."\n",
            order = 6,
        },
        info2 = {
            type = "description",
            name = "|cffffcc00"..L["BTEST_Info2"].."|r",
            order = 7,
        },
    },
}
-- [ Local Functions ] --

-- startDrag(): Enables dragging of the buttons.
local function startDrag()
    buttons[1]:StartMoving()
end

-- stopDrag(): Disables dragging of the buttons.
local function stopDrag()
    local frame = buttons[1]
    local p ,rel ,rp ,X ,Y = frame:GetPoint()
    frame:StopMovingOrSizing()
    db.x = X
    db.y = Y
end

-- [ Core Methods ] --

-- :OnInitialize(): Initialize the module.
function mod:OnInitialize()
    -- Set up defaults.
    local defaults = {
        profile = {
            enabled = false,
            drag = false,
            skin = {
                ID = "Blizzard",
                Gloss = false,
                Backdrop = false,
                Colors = {},
            },
        },
    }

    -- Set up the DB.
    self.db = self:RegisterNamespace("ButtonTest", defaults)
    db = self.db.profile

    -- Set up options.
    self:RegisterModuleOptions("ButtonTest", options)
end

-- :OnEnable(): Enable function.
function mod:OnEnable()
    LBF:RegisterSkinCallback("ButtonTest", self.SkinCallback, self)
    local group = LBF:Group("ButtonTest")
    group:Skin(db.skin.ID or "Blizzard", db.skin.Gloss, db.skin.Backdrop, db.skin.Backdrop)
    if #buttons == 0 then
        local btn
        btn = CreateFrame("CheckButton", "BF_ButtonTest1", UIParent, "ActionBarButtonTemplate")
        btn:SetID(1)
        btn:ClearAllPoints()
        btn:SetPoint("TOPLEFT", UIParent, "TOPLEFT", db.x or 100, db.y or -200)
        BF_ButtonTest1HotKey:SetText("H")
        BF_ButtonTest1Count:SetText("C")
        BF_ButtonTest1Name:SetText("Name")
        buttons[1] = btn
        btn = CreateFrame("CheckButton", "BF_ButtonTest2", UIParent, "BonusActionButtonTemplate")
        btn:SetID(1)
        btn:ClearAllPoints()
        btn:SetPoint("TOPLEFT", buttons[1], "TOPRIGHT", 4, 0)
        BF_ButtonTest2HotKey:SetText("H")
        BF_ButtonTest2Count:SetText("C")
        BF_ButtonTest2Name:SetText("Name")
        buttons[2] = btn
        btn = CreateFrame("CheckButton", "BF_ButtonTest3", UIParent, "ShapeshiftButtonTemplate")
        btn:SetID(1)
        btn:ClearAllPoints()
        btn:SetPoint("TOPLEFT", buttons[2], "TOPRIGHT", 4, 0)
        BF_ButtonTest3HotKey:SetText("H")
        BF_ButtonTest3Count:SetText("C")
        BF_ButtonTest3Name:SetText("Name")
        buttons[3] = btn
        btn = CreateFrame("CheckButton", "BF_ButtonTest4", UIParent, "ItemButtonTemplate")
        btn:SetID(1)
        btn:ClearAllPoints()
        btn:SetPoint("TOPLEFT", buttons[3], "TOPRIGHT", 4, 0)
        BF_ButtonTest4Count:SetText("C")
        buttons[4] = btn
        btn = CreateFrame("CheckButton", "BF_ButtonTest5", UIParent, "PetActionButtonTemplate")
        btn:SetID(1)
        btn:ClearAllPoints()
        btn:SetPoint("TOPLEFT",buttons[4], "TOPRIGHT", 4, 0)
        BF_ButtonTest5HotKey:SetText("H")
        BF_ButtonTest5Count:SetText("C")
        BF_ButtonTest5Name:SetText("Name")
        buttons[5] = btn
        btn = CreateFrame("CheckButton", "BF_ButtonTest6", UIParent, "ActionButtonTemplate, SecureActionButtonTemplate")
        btn:ClearAllPoints()
        btn:SetPoint("TOPLEFT", buttons[5], "TOPRIGHT", 4, 0)
        BF_ButtonTest6HotKey:SetText("H")
        BF_ButtonTest6Count:SetText("C")
        BF_ButtonTest6Name:SetText("Name")
        local spellFirstAidIcon
        _, _, spellFirstAidIcon = GetSpellInfo(27028)
        BF_ButtonTest6Icon:SetTexture(spellFirstAidIcon)
        buttons[6] = btn
    end
    for i = 1, #buttons do
        group:AddButton(buttons[i])
        buttons[i]:Show()
    end
    buttons[1]:ClearAllPoints()
    buttons[1]:SetPoint("TOPLEFT", UIParent, "TOPLEFT", db.x or 100, db.y or -200)
    self:SetDrag()
end

-- :OnEnable(): Disable function.
function mod:OnDisable()
    local group = LBF:Group("ButtonTest")
    for i = 1, #buttons do
        group:RemoveButton(buttons[i])
        buttons[i]:Hide()
    end
    buttons[1]:ClearAllPoints()
    buttons[1]:SetPoint("TOPLEFT", UIParent, "BOTTOMRIGHT", 100, -200)
    group:Delete()
    BF:RemoveModuleOptions("ButtonTest")
end

-- :Refresh(): Refreshes the module's state.
function mod:Refresh()
    db = self.db.profile
end

-- setDrag(): Sets the drag state.
function mod:SetDrag()
    if db.drag then
        if not dragbar then
            dragbar = CreateFrame("Frame", "BF_ButtonTestDragbar", UIParent)
            dragbar:EnableMouse(true)
            dragbar:RegisterForDrag("LeftButton")
            dragbar:SetBackdrop({
                bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
                tile = true,
                tileSize = 16,
                edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
                edgeSize = 16,
                insets = {left = 0, right = 0, top = 0, bottom = 0}
            })
            dragbar:SetBackdropColor(0, 0.5, 0, 0.9)
            dragbar:SetBackdropBorderColor(0, 0, 0, 0)
            dragbar:ClearAllPoints()
            dragbar:SetPoint("TOPLEFT", buttons[1], "TOPLEFT")
            dragbar:SetPoint("BOTTOMRIGHT", buttons[5], "BOTTOMRIGHT")
        end
        buttons[1]:SetMovable(true)
        dragbar:SetFrameLevel(100)
        dragbar:Show()
        dragbar:SetScript("OnDragStart", startDrag)
        dragbar:SetScript("OnDragStop", stopDrag)
    elseif dragbar then
        buttons[1]:SetMovable(false)
        dragbar:Hide()
        dragbar:SetScript("OnDragStart", nil)
        dragbar:SetScript("OnDragStop", nil)
    end
end

-- :SkinCallBack(): Callback function to store settings.
function mod:SkinCallback(SkinID, Gloss, Backdrop, Group, Button, Colors)
    if not Group then
        db.skin.ID = SkinID
        db.skin.Gloss = Gloss
        db.skin.Backdrop = Backdrop
        db.skin.Colors = Colors
    end
end
