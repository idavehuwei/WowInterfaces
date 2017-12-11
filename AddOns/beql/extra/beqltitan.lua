if not IsAddOnLoaded("Titan") then
    -- Do not load if Titanbar is not loaded
    return
end
local beql = LibStub("AceAddon-3.0"):GetAddon("beql")
local L = LibStub("AceLocale-3.0"):GetLocale("beql")
local titanmenu = AceLibrary("Dewdrop-2.0")
local menuregistered = false

function TitanPanelbeqlButton_OnLoad()
    this.registry = {
        id = "beql",
        menuText = "bEQL",
        tooltipTitle = "bEQL",
        tooltipTextFunction = "TitanPanelbeqlButton_GetTooltipText",
        category = "Information",
        builtin = 1,
        icon = "Interface\\Icons\\INV_Letter_03",
        iconWidth = 16,
        iconButtonWidth = 16,
        buttonTextFunction = "TitanPanelbeqlButton_GetButtonText",
        savedVariables = {
            ShowIcon = 1,
        },
    }
end

function TitanPanelbeqlButton_GetTooltipText()
    local tooltiptext = ""
    local _,questEntries = GetNumQuestLogEntries()
    local _, numfinished = beqlQ:GetNumQuests()

    tooltiptext = tooltiptext.."\n"
    tooltiptext = tooltiptext..L["|cffffffffQuests|r"].."\t"..TitanUtils_GetHighlightText(questEntries.."\n")
    tooltiptext = tooltiptext..L["|cffff8000Tracked Quests|r"].."\t"..TitanUtils_GetHighlightText(GetNumQuestWatches().."\n")
    tooltiptext = tooltiptext..L["|cff00d000Completed Quests|r"].."\t"..TitanUtils_GetHighlightText(numfinished)
    tooltiptext = tooltiptext.."\n\n"
    tooltiptext = tooltiptext..L["|cffeda55fClick|r to open Quest Log and |cffeda55fShift+Click|r to open Waterfall config"]

    return tooltiptext
end

function TitanPanelbeqlButton_GetButtonText()
    local _,questEntries = GetNumQuestLogEntries()
    return questEntries.."/25"
end

function TitanPanelbeqlButton_OnClick(button)
    if ( button == "LeftButton" ) then
        if IsShiftKeyDown() then
            InterfaceOptionsFrame_OpenToCategory(beql3.optionsFrames["main"])
        else
            ToggleFrame(QuestLogFrame);
        end
    elseif ( button == "RightButton" ) then
        if not menuregistered then
            menuregister = true
            titanmenu:Register(TitanPanelbeqlButton, 'children', function()
                titanmenu:FeedAceOptionsTable(beql.options)
            end)
        end
        titanmenu:Open(TitanPanelbeqlButton)
    end
end
