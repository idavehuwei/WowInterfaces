--
--  Overachiever - Tabs: Watch.lua
--    by Tuhljin
--
--  If you don't wish to use the watch tab, feel free to delete this file or rename it (e.g. to Watch_unused.lua).
--  The addon's other features will work regardless.
--

local L = OVERACHIEVER_STRINGS

local VARS
local frame, panel, sortdrop
local NoneWatchedLabel

local function SortDrop_OnSelect(self, value)
    VARS.WatchSort = value
    frame.sort = value
    frame:ForceUpdate(true)
end

local function OnLoad(v)
    VARS = v
    sortdrop:SetSelectedValue(VARS.WatchSort or 0)
    VARS.WatchedList = VARS.WatchedList or {}
end

frame, panel = Overachiever.BuildNewTab("Overachiever_WatchFrame", L.WATCH_TAB,
    "Interface\\AddOns\\Overachiever_Tabs\\WatchWatermark", L.WATCH_HELP, OnLoad)

sortdrop = TjDropDownMenu.CreateDropDown("Overachiever_WatchFrameSortDrop", panel, {
    {
        text = L.TAB_SORT_NAME,
        value = 0
    },
    {
        text = L.TAB_SORT_COMPLETE,
        value = 1
    },
    {
        text = L.TAB_SORT_POINTS,
        value = 2
    },
    {
        text = L.TAB_SORT_ID,
        value = 3
    };
})
sortdrop:SetLabel(L.TAB_SORT, true)
sortdrop:SetPoint("TOPLEFT", panel, "TOPLEFT", -16, -22)
sortdrop:OnSelect(SortDrop_OnSelect)

function frame.SetNumListed(num)
    if (num > 0) then
        if (NoneWatchedLabel) then NoneWatchedLabel:Hide(); end
    elseif (not NoneWatchedLabel) then
        NoneWatchedLabel = frame:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
        NoneWatchedLabel:SetPoint("TOP", frame, "TOP", 0, -189)
        NoneWatchedLabel:SetText(L.WATCH_EMPTY)
        NoneWatchedLabel:SetWidth(490)
    else
        NoneWatchedLabel:Show()
    end
end


local function Refresh()
    local list, count = frame.AchList, 0
    wipe(list)
    for id in pairs(VARS.WatchedList) do
        count = count + 1
        list[count] = id
    end
    Overachiever_WatchFrameContainerScrollBar:SetValue(0)
    frame:ForceUpdate(true)
end

panel:SetScript("OnShow", Refresh)

function frame.SetAchWatchList(id, add)
    if (add) then
        VARS.WatchedList[id] = true
        PlaySound("igMainMenuOptionCheckBoxOn")
    else
        VARS.WatchedList[id] = nil
        PlaySound("igMainMenuOptionCheckBoxOff")
    end
    if (frame:IsShown()) then
        Refresh()
    else
        Overachiever.FlashTab(frame.tab)
    end
end

local orig_AchievementButton_OnClick = AchievementButton_OnClick
AchievementButton_OnClick = function(self, ignoreModifiers, ...)
    if (not ignoreModifiers and IsAltKeyDown()) then
        frame.SetAchWatchList(self.id, true)
        return;
    end
    orig_AchievementButton_OnClick(self, ignoreModifiers, ...)
end



--[[
-- /run Overachiever.Debug_DumpWatch()
function Overachiever.Debug_DumpWatch()
  local tab = {}
  for id in pairs(VARS.WatchedList) do
    tab[#tab+1] = id
  end
  sort(tab)
  local s = "{ "..strjoin(", ", unpack(tab)).." }"
  print(s)
  error(s)
end
--]]
