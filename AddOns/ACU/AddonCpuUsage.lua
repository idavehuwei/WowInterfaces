
ACU = LibStub ("AceAddon-3.0"):NewAddon ("AddonCpuUsage", "AceConsole-3.0", "AceTimer-3.0")

local ACU = ACU
local LDB = LibStub ("LibDataBroker-1.1", true)
local LDBIcon = LDB and LibStub ("LibDBIcon-1.0", true)
local SharedMedia = LibStub:GetLibrary("LibSharedMedia-3.0")

--local debugmode = true
local debugmode = false

local GetAddOnInfo   = GetAddOnInfo
--local GetFramerate   = GetFramerate
local GetNumAddOns   = GetNumAddOns
local GetAddOnCPUUsage       = GetAddOnCPUUsage
local UpdateAddOnCPUUsage    = UpdateAddOnCPUUsage

local CPUResetUsage = ResetCPUUsage
ResetCPUUsage = function()
    return print ("The command 'ResetCPUUsage' is being used by Addons Cpu Usage addon.")
end

local EventFrame = CreateFrame ("frame", "ACUEventFrame", UIParent)
local TimeFrame = CreateFrame ("frame", "ACUTimeFrame", UIParent)

ACU.DataPool = {}
local ENABLED = false

local default_db = {
    profile = {
        Minimap = {hide = false, radius = 160, minimapPos = 220},
        start_delay = 3,
        sample_size = 180,
        data_pool = {},
        first_run = false,
    },
}

local OptionsTable = {
    name = "AddonCpuUsage",
    type = "group",
    args = {
        ShowMiniMap = {
            type = "toggle",
            name = "Minimap Icon",
            desc = "Show or hide the minimap icon.",
            order = 3,
            get = function() return ACU.db.profile.Minimap.hide end,
            set = function (self, val)
                ACU.db.profile.Minimap.hide = not ACU.db.profile.Minimap.hide
                LDBIcon:Refresh ("AddonCpuUsage", ACU.db.profile.Minimap)
                if (ACU.db.profile.Minimap.hide) then
                    LDBIcon:Show ("AddonCpuUsage")
                else
                    LDBIcon:Hide ("AddonCpuUsage")
                end
            end,
        },
        StartDelay = {
            type = "range",
            name = "Start Delay",
            desc = "After the encounter beginning, way X seconds to start gather data.",
            min = 0,
            max = 5,
            step = 1,
            get = function() return ACU.db.profile.start_delay end,
            set = function (self, val) ACU.db.profile.start_delay = val end,
            order = 1,
        },
        SampleSize = {
            type = "range",
            name = "Gather Time",
            desc = "Time to stay gathering data from addons.",
            min = 120,
            max = 300,
            step = 1,
            get = function() return ACU.db.profile.sample_size end,
            set = function (self, val) ACU.db.profile.sample_size = val end,
            order = 1,
        },
    }
}

function ACU:OnInitialize()

    self.db = LibStub ("AceDB-3.0"):New ("AddonCpuUsageDB", default_db, true)

    LibStub ("AceConfig-3.0"):RegisterOptionsTable ("AddonCpuUsage", OptionsTable)
    ACU.OptionsFrame1 = LibStub ("AceConfigDialog-3.0"):AddToBlizOptions ("AddonCpuUsage", "AddonCpuUsage")
    --sub tab
    LibStub ("AceConfig-3.0"):RegisterOptionsTable ("AddonCpuUsage-Profiles", LibStub ("AceDBOptions-3.0"):GetOptionsTable (self.db))
    ACU.OptionsFrame2 = LibStub ("AceConfigDialog-3.0"):AddToBlizOptions ("AddonCpuUsage-Profiles", "Profiles", "AddonCpuUsage")

    if (LDB) then
        local databroker = LDB:NewDataObject ("AddonCpuUsage", {
            type = "launcher",
            icon = [[Interface\AddOns\ACU\icon]],
            OnClick = function (self, button)
                if (button == "LeftButton") then
                    if (not ACUMainFrame) then
                        ACU:CreateMainWindow()
                    else
                        ACUMainFrame:Show()
                    end
                else
                    InterfaceOptionsFrame_OpenToCategory ("AddonCpuUsage")
                    InterfaceOptionsFrame_OpenToCategory ("AddonCpuUsage")
                end
            end,
            OnTooltipShow = function (tooltip)
                GameTooltip:AddLine ("Addon CPU Usage")
                GameTooltip:AddLine ("|cFFFFFF00Left Click|r: open cpu panel.")
                GameTooltip:AddLine ("|cFFFFFF00Right Click|r: open options.")
            end
        })

        if (databroker and not LDBIcon:IsRegistered ("AddonCpuUsage")) then
            LDBIcon:Register ("AddonCpuUsage", databroker, ACU.db.profile.Minimap)
        end
    end

    ENABLED = ACU:IsProfileEnabled()

    --debug
    if (debugmode or ACU.db.profile.auto_open) then
        function ACU:ShowMe()
            ACUMainFrame:Show()
        end

        ACU:CreateMainWindow()
        ACUMainFrame:Show()
        ACU:ScheduleTimer ("ShowMe", 1)

        ACU.db.profile.auto_open = nil

        if (debugmode) then
            ACU.DataPool = ACU.db.profile.data_pool
        end
    end
end

ACU:RegisterChatCommand ("cpu", function()
    if (not ACUMainFrame) then
        ACU:CreateMainWindow()
    else
        ACUMainFrame:Show()
    end
end)

function ACU:Msg (msg)
    print ("|cFFFFCC00AddOns CPU Usage|r:", msg)
end

function ACU:IsProfileEnabled()
    return GetCVar ("scriptProfile") == "1"
end

function ACU:SetProfileEnabled (enabled)
    SetCVar ("scriptProfile", enabled and 1 or 0)
    if (enabled) then
        ACU.db.profile.auto_open = true
    end
    ReloadUI()
end

local highlight = "|cFFFFFF00"
local tutorial_phrases = {
    "|cFFFFFFFF1|r) Enter in a raid instance (can be a raid finder one).",
    "|cFFFFFFFF2|r) When inside the instance, check if the " .. highlight .. "Cpu Performance Profiler|r is enabled (see at the bottom of the window).",
    "|cFFFFFFFF3|r) If isn't enabled, click on the '" .. highlight .. "Start Profiler|r' button.",
    "|cFFFFFFFF4|r) Play a boss encounter for at least " .. highlight .. "two minutes|r.",
    "|cFFFFFFFF5|r) At the end, the addon shows to you the window with the results.",
    "\n\n|cFFFFFFFFImportant:|r) When you are done with your tests, make sure to disable the Cpu Profiler clicking on the '" .. highlight .. "Stop Profiler|r' button.",
}

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--> events

    local sort_func = function (t1, t2)
        return t1[2] > t2[2]
    end

    local min_time = 120

    function ACU:TimerEnd()
        ACU.CurrentEncounter.incombat = false

        if (ACU.CurrentEncounter.delay_thread) then
            ACU:CancelTimer (ACU.CurrentEncounter.delay_thread)
        end
        if (ACU.CurrentEncounter.tick_thread) then
            ACU:CancelTimer (ACU.CurrentEncounter.tick_thread)
        end

        local elapsed_time = GetTime() - ACU.CurrentEncounter.start

        TimeFrame:SetScript ("OnUpdate", nil)

        ACU.CurrentEncounter.cpu_time = TimeFrame.cpu_time
        ACU.CurrentEncounter.addons_time = TimeFrame.addons_time

        if (debugmode) then
            min_time = 0
        end

        ACU.capture_panel:Hide()

        if (elapsed_time >= min_time) then
            local addons = ACU.CurrentEncounter.addons
            local ordered = {}
            for name, addon in pairs (addons) do
                ordered [#ordered+1] = {name, addon.total, addon}
            end
            table.sort (ordered, sort_func)
            ordered.elapsed_time = elapsed_time

            ordered.showing = {}
            for i = 1, min (#ordered, 3) do
                ordered.showing [ordered[i][1]] = true
            end

            ordered.total_cpu_by_addons = ACU.CurrentEncounter.total
            ordered.cpu_time = ACU.CurrentEncounter.cpu_time
            ordered.addons_time = ACU.CurrentEncounter.addons_time

            if (debugmode) then
                table.wipe (ACU.DataPool)
                tinsert (ACU.DataPool, 1, ordered)
                ACU.db.profile.data_pool = ACU.DataPool

                if (ACU.CurrentEncounter.tick_thread) then
                    ACU:CancelTimer (ACU.CurrentEncounter.tick_thread)
                end
            else
                tinsert (ACU.DataPool, 1, ordered)
            end

            ACU:Msg ("data successfully captured.")
        else
            ACU:Msg ("combat elapsed time was too short.")
        end

        if (not InCombatLockdown() and not UnitAffectingCombat ("player")) then
            if (not ACUMainFrame) then
                ACU:CreateMainWindow()
            else
                ACUMainFrame:Show()
            end
        else
            ACU:Msg ("waiting the end of the combat to open the window.")
        end

    end

    local function calc_cpu_intervals (self, elapsed)

        UpdateAddOnCPUUsage()

        local delay = 0

        local addons = self.addons
        for addon_name, last_value in pairs (addons) do
            local usage = GetAddOnCPUUsage (addon_name)
            delay = delay + (usage - last_value)
            addons [addon_name] = usage
        end

        local game_time = elapsed - delay
        local addons_time = elapsed - game_time

        self.cpu_time = self.cpu_time + game_time
        self.addons_time = self.addons_time + addons_time

    end

    function ACU:Tick (t)
        --check timeout
        local elapsed_time = GetTime() - ACU.CurrentEncounter.start

        if (elapsed_time >= ACU.db.profile.sample_size) then
            ACU.show_on_encounter_end = true
            return ACU:TimerEnd()
        end

        local percent = elapsed_time / ACU.db.profile.sample_size * 100
        ACU.capture_panel.statusbar:SetValue (percent)
        ACU.capture_panel.percent:SetText (floor (percent) .. "%")
        ACU.capture_panel.statusbar.spark:SetPoint ("center", ACU.capture_panel.statusbar, "left", ACU.capture_panel.statusbar:GetWidth()/100*percent, -1)

        UpdateAddOnCPUUsage()

        -- calc addons cpu usage
        local total_usage = 0

        for name, addon in pairs (ACU.CurrentEncounter.addons) do

            local cpu = GetAddOnCPUUsage (name)
            local diff = cpu - addon.last_value

            addon [#addon+1] = diff
            addon.last_value = cpu
            addon.total = cpu

            total_usage = total_usage + diff

            if (diff > addon.max_value) then
                addon.max_value = diff
            end
        end

        ACU.CurrentEncounter.total = ACU.CurrentEncounter.total + total_usage
    end

    function ACU:StartTicker()
        if (ACU.CurrentEncounter.incombat) then
            ACU.CurrentEncounter.delay_thread = false

            UpdateAddOnCPUUsage()

            local addons = ACU.CurrentEncounter.addons
            local total_addons = GetNumAddOns()
            TimeFrame.addons = {}

            for i = 1, total_addons do
                local name, title, notes, loadable, reason, security, newVersion = GetAddOnInfo (i)
                if (GetAddOnCPUUsage (name) > 0 and name ~= "ACU") then
                    addons [name] = {max_value = 0, total = 0, last_value = 0, index = i}
                    TimeFrame.addons [name] = 0
                end
            end

            CPUResetUsage()

            ACU.CurrentEncounter.tick_thread = ACU:ScheduleRepeatingTimer ("Tick", 1)

            TimeFrame.cpu_time = 0
            TimeFrame.addons_time = 0
            --TimeFrame:SetScript ("OnUpdate", calc_cpu_intervals)

            if (debugmode) then
                ACU:Msg ("loop started.")
            end

            ACU.capture_panel:Show()
            ACU.capture_panel.statusbar:SetValue (0)
            ACU.capture_panel.percent:SetText ("0%")

            if (ACUMainFrame and ACUMainFrame:IsShown()) then
                ACUMainFrame:Hide()
            end

        end
    end

    EventFrame:SetScript ("OnEvent", function (self, event, ...)

        if ((event == "ENCOUNTER_START" and not debugmode) or event == "PLAYER_REGEN_DISABLED") then

            if (debugmode) then
                ACU:Msg ("encounter started.")
            end

            if (ACU:IsProfileEnabled()) then
                ACU.CurrentEncounter = {
                    delay = ACU.db.profile.start_delay,
                    start = GetTime() + ACU.db.profile.start_delay,
                    addons = {},
                    incombat = true,
                    total = 0,

                }
                ACU.CurrentEncounter.delay_thread = ACU:ScheduleTimer ("StartTicker", ACU.db.profile.start_delay)

                if (debugmode) then
                    ACU:Msg ("delay tick thread created, waiting " .. ACU.db.profile.start_delay .. " seconds to start.")
                end
            end

        elseif ((event == "ENCOUNTER_END" and not debugmode) or event == "PLAYER_REGEN_ENABLED") then

            if (debugmode) then
                ACU:Msg ("encounter ended.")
            end

            if (ACU:IsProfileEnabled() and ACU.CurrentEncounter and ACU.CurrentEncounter.incombat) then
                if (debugmode) then
                    ACU:Msg ("starting timerend().")
                end
                ACU:TimerEnd()
            end

            if (ACU.show_on_encounter_end) then
                if (not ACUMainFrame) then
                    ACU:CreateMainWindow()
                else
                    ACUMainFrame:Show()
                end
                ACU.show_on_encounter_end = nil
            end

        elseif (event == "ZONE_CHANGED_NEW_AREA") then

            --verifica se o profiling ta ativo
                -- se tiver pergunta se quer desativar
                -- dispara depois de um /reload?

        end
    end)

    EventFrame:RegisterEvent ("ENCOUNTER_START")
    EventFrame:RegisterEvent ("ENCOUNTER_END")
    EventFrame:RegisterEvent ("ZONE_CHANGED_NEW_AREA")

    --debug
    if (debugmode) then
        EventFrame:RegisterEvent ("PLAYER_REGEN_DISABLED")
        EventFrame:RegisterEvent ("PLAYER_REGEN_ENABLED")
    end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    function ACU:CreateMainWindow()

        -- main frame
        local f = CreateFrame ("frame", "ACUMainFrame", UIParent)
        f:SetSize (780, 450)
        f:SetPoint ("center", UIParent, "center")
        f:EnableMouse (true)
        f:SetMovable (true)
        f:SetBackdrop ({bgFile = [[Interface\AddOns\ACU\background]], tileSize = 64, edgeFile = [[Interface\AddOns\ACU\border_2]], edgeSize = 16, insets = {left = 1, right = 1, top = 1, bottom = 1}})
        tinsert (UISpecialFrames, "ACUMainFrame")
        f:SetBackdropColor (0, 0, 0, 0.6)
        f:SetScript ("OnMouseDown", function (self, button)
            if (not self.isMoving and button == "LeftButton") then
                self.isMoving = true
                self:StartMoving()
            end
        end)
        f:SetScript ("OnMouseUp", function (self, button)
            if (self.isMoving) then
                self.isMoving = nil
                self:StopMovingOrSizing()
            end
        end)

        -- close button
        local c = CreateFrame ("Button", nil, f, "UIPanelCloseButton")
        c:SetWidth (32)
        c:SetHeight (32)
        c:SetPoint ("topright",  f, "topright", -3, -8)
        c:SetFrameLevel (f:GetFrameLevel()+1)
        c:SetAlpha (1)
        c:Hide()

        --title
        local icon = f:CreateTexture (nil, "overlay")
        icon:SetTexture ([[Interface\AddOns\ACU\icon]])
        icon:SetSize (24, 24)
        icon:SetPoint ("topleft", f, "topleft", 10, -10)
        local title = f:CreateFontString (nil, "overlay", "GameFontNormal")
        title:SetText ("Addons CPU Usage")
        title:SetPoint ("left", icon, "right", 6, 0)

        --total usage:
        local totalusage = f:CreateFontString (nil, "overlay", "GameFontNormal")
        totalusage:SetText ("Total:")
        totalusage:SetTextColor (1, 1, 1)
        totalusage:SetPoint ("left", title, "right", 64, 0)
        local totalusage2 = f:CreateFontString (nil, "overlay", "GameFontNormal")
        totalusage2:SetText ("--x--x--")
        totalusage2:SetPoint ("left", totalusage, "right", 3, 0)
        ACU.totalusage2 = totalusage2

        local totalusage_tooltip = CreateFrame ("frame", nil, f)
        totalusage_tooltip:SetFrameLevel (f:GetFrameLevel()+1)
        totalusage_tooltip:SetPoint ("left", totalusage, "left")
        totalusage_tooltip:SetSize (100, 20)
        totalusage_tooltip:SetScript ("OnEnter", function (self)
            GameTooltip:SetOwner (self, "ANCHOR_CURSOR")
            GameTooltip:AddLine ("Total Time Spent")
            GameTooltip:AddLine (" ")
            GameTooltip:AddLine ("Amount of time where the game has freezed\nto process information from addons.\n\nThis amount are distributed among\nevery frame processed.")
            if (ACU.DataPool [1] and ACU.DataPool [1].total_cpu_by_addons) then
                --GameTooltip:AddLine (" ")
                --GameTooltip:AddLine ("Total Frames Lost: " .. floor (ACU.DataPool [1].total_cpu_by_addons / 16))
                --local total = ACU.DataPool [1].total_cpu_by_addons / 1000
                --ACU.totalusage2:SetText (format ("%.2fs", total) .. " (" .. format ("%.1f", total / ACU.DataPool [1].elapsed_time * 100) .. "%)")
                --local average = ACU.DataPool [1].total_cpu_by_addons / ACU.DataPool [1].elapsed_time
                --ACU.averageusage2:SetText (format ("%.2fms", average))
                --ACU.fpsloss2:SetText (format ("%.2ffps", average/16.6))
            end
            GameTooltip:Show()
        end)
        totalusage_tooltip:SetScript ("OnLeave", function (self)
            GameTooltip:Hide()
        end)

        local averageusage = f:CreateFontString (nil, "overlay", "GameFontNormal")
        averageusage:SetText ("Average:")
        averageusage:SetTextColor (1, 1, 1)
        averageusage:SetPoint ("left", title, "right", 190, 0)
        local averageusage2 = f:CreateFontString (nil, "overlay", "GameFontNormal")
        averageusage2:SetText ("--x--x--")
        averageusage2:SetPoint ("left", averageusage, "right", 3, 0)
        ACU.averageusage2 = averageusage2

        local averageusage_tooltip = CreateFrame ("frame", nil, f)
        averageusage_tooltip:SetFrameLevel (f:GetFrameLevel()+1)
        averageusage_tooltip:SetPoint ("left", averageusage, "left")
        averageusage_tooltip:SetSize (100, 20)
        averageusage_tooltip:SetScript ("OnEnter", function (self)
            GameTooltip:SetOwner (self, "ANCHOR_CURSOR")
            GameTooltip:AddLine ("Average Time Spent")
            GameTooltip:AddLine (" ")
            GameTooltip:AddLine ("Average time in milliseconds used\nto process addons information.\n\nThe game needs to deliver one\nframe every |cFFFFFF0016ms|r, any delay causes\na frame rate loss.")
            GameTooltip:Show()
        end)
        averageusage_tooltip:SetScript ("OnLeave", function (self)
            GameTooltip:Hide()
        end)

        local fpsloss = f:CreateFontString (nil, "overlay", "GameFontNormal")
        fpsloss:SetText ("Loss:")
        fpsloss:SetTextColor (1, 1, 1)
        fpsloss:SetPoint ("left", title, "right", 305, 0)
        local fpsloss2 = f:CreateFontString (nil, "overlay", "GameFontNormal")
        fpsloss2:SetText ("--x--x--")
        fpsloss2:SetPoint ("left", fpsloss, "right", 3, 0)
        ACU.fpsloss2 = fpsloss2

        local fpsloss_tooltip = CreateFrame ("frame", nil, f)
        fpsloss_tooltip:SetFrameLevel (f:GetFrameLevel()+1)
        fpsloss_tooltip:SetPoint ("left", fpsloss, "left")
        fpsloss_tooltip:SetSize (100, 20)
        fpsloss_tooltip:SetScript ("OnEnter", function (self)
            GameTooltip:SetOwner (self, "ANCHOR_CURSOR")
            GameTooltip:AddLine ("Frame Lost Per Second")
            GameTooltip:AddLine (" ")

            if (ACU.DataPool [1] and ACU.DataPool [1].cpu_time) then
                GameTooltip:AddLine (" ")
                GameTooltip:AddLine ("CPU Time: " .. ACU.DataPool [1].cpu_time)
                GameTooltip:AddLine ("Addons Time: " .. ACU.DataPool [1].addons_time)
            end

            GameTooltip:Show()
        end)
        fpsloss_tooltip:SetScript ("OnLeave", function (self)
            GameTooltip:Hide()
        end)

        --isn't working / not accuracy result
        fpsloss:Hide()
        fpsloss2:Hide()
        fpsloss_tooltip:Hide()

        --help tooltip
        local help_str = f:CreateFontString (nil, "overlay", "GameFontNormal")
        help_str:SetText ("How to Use")
        help_str:SetTextColor (.7, .7, .7)
        help_str:SetPoint ("left", title, "right", 365, 0)

        local help_image = f:CreateTexture (nil, "overlay")
        help_image:SetTexture ([[Interface\Calendar\EventNotification]])
        help_image:SetPoint ("left", help_str, "right")
        help_image:SetSize (24, 24)
        help_image:SetDesaturated (true)

        local help_tooltip = CreateFrame ("frame", nil, f)
        help_tooltip:SetFrameLevel (f:GetFrameLevel()+1)
        help_tooltip:SetPoint ("left", help_str, "left")
        help_tooltip:SetSize (100, 20)
        help_tooltip:SetScript ("OnEnter", function (self)
            help_image:SetDesaturated (false)
            help_str:SetTextColor (1, 1, 1)
            GameTooltip:SetOwner (self, "ANCHOR_CURSOR")

            GameTooltip:AddLine ("Follow these steps:")
            GameTooltip:AddLine (" ")

            for _, phrase in ipairs (tutorial_phrases) do
                GameTooltip:AddLine (phrase)
            end

            GameTooltip:Show()
        end)
        help_tooltip:SetScript ("OnLeave", function (self)
            help_image:SetDesaturated (true)
            help_str:SetTextColor (.7, .7, .7)
            GameTooltip:Hide()
        end)

        --chart frame
        local chart = CreateACUChartPanel (f, 765, 370, "ACUChartFrame")
        chart:SetPoint ("topleft", f, "topleft", 10, -50)
        chart:SetBackdrop ({bgFile = [[Interface\AddOns\ACU\background]], tileSize = 64, edgeFile = [[Interface\AddOns\ACU\border_2]], edgeSize = 16, insets = {left = 1, right = 1, top = 1, bottom = 1}})
        chart:SetBackdropColor (0, 0, 0, 0.2)
        chart:SetBackdropBorderColor (0, 0, 0, 0)
        chart:SetScript ("OnMouseDown", function (self, button)
            if (not f.isMoving and button == "LeftButton") then
                f.isMoving = true
                f:StartMoving()
            end
        end)
        chart:SetScript ("OnMouseUp", function (self, button)
            if (f.isMoving) then
                f.isMoving = nil
                f:StopMovingOrSizing()
            end
        end)

        chart.CloseButton:Hide()
        chart.Graphic:SetBackdropColor (0, 0, 0, 0)
        chart.Graphic:SetBackdropBorderColor (0, 0, 0, 0)

        --table frame
        local table_frame = CreateFrame ("frame", "ACUTableFrame", f)
        table_frame:SetPoint ("topleft", f, "topleft", 10, -50)
        table_frame:SetSize (765, 370)
        table_frame:SetBackdrop ({bgFile = [[Interface\AddOns\ACU\background]], tileSize = 64, edgeFile = [[Interface\AddOns\ACU\border_2]], edgeSize = 16, insets = {left = 1, right = 1, top = 1, bottom = 1}})
        table_frame:SetBackdropColor (0, 0, 0, 0.2)
        table_frame:SetBackdropBorderColor (0, 0, 0, 0)
        table_frame:SetScript ("OnMouseDown", function (self, button)
            if (not f.isMoving and button == "LeftButton") then
                f.isMoving = true
                f:StartMoving()
            end
        end)
        table_frame:SetScript ("OnMouseUp", function (self, button)
            if (f.isMoving) then
                f.isMoving = nil
                f:StopMovingOrSizing()
            end
        end)

        table_frame.lines = {}

        local on_click_checkbox = function (self)
            if (ACU.DataPool [1] and ACU.DataPool [1].showing and ACU.DataPool [1].showing) then
                ACU.DataPool [1].showing [self.addon] = not ACU.DataPool [1].showing [self.addon]
            end
        end

        --titles
        local index_string_title = table_frame:CreateFontString (nil, "overlay", "GameFontNormal")
        local name_string_title = table_frame:CreateFontString (nil, "overlay", "GameFontNormal")
        local total_usage_string_title = table_frame:CreateFontString (nil, "overlay", "GameFontNormal")
        local total_psec_string_title = table_frame:CreateFontString (nil, "overlay", "GameFontNormal")
        local total_percent_string_title = table_frame:CreateFontString (nil, "overlay", "GameFontNormal")
        local peak_string_title = table_frame:CreateFontString (nil, "overlay", "GameFontNormal")
        local graphic_checkbox_title = table_frame:CreateFontString (nil, "overlay", "GameFontNormal")

        local function CreateTooltipAnchor (anchor, title, tooltip)
            local tframe = CreateFrame ("frame", nil, f)
            tframe:SetFrameLevel (f:GetFrameLevel()+3)
            tframe:SetPoint ("left", anchor, "left")
            tframe:SetSize (80, 20)
            tframe:SetScript ("OnEnter", function (self)
                GameTooltip:SetOwner (self, "ANCHOR_CURSOR")
                GameTooltip:AddLine (title)
                GameTooltip:AddLine (" ")
                GameTooltip:AddLine (tooltip)
                GameTooltip:Show()
            end)
            tframe:SetScript ("OnLeave", function (self)
                GameTooltip:Hide()
            end)
        end

        CreateTooltipAnchor (total_usage_string_title, "Total Usage", "Total time in seconds used by the\naddon to process information.")
        CreateTooltipAnchor (total_psec_string_title, "Milliseconds", "Average time used every second.")
        CreateTooltipAnchor (peak_string_title, "Peak", "Highest usage during the measure.")

        index_string_title:SetPoint ("topleft", table_frame, "topleft", 7, 0)
        name_string_title:SetPoint ("topleft", table_frame, "topleft", 24, 0)
        total_usage_string_title:SetPoint ("topleft", table_frame, "topleft", 204, 0)
        total_psec_string_title:SetPoint ("topleft", table_frame, "topleft", 303, 0)
        total_percent_string_title:SetPoint ("topleft", table_frame, "topleft", 405, 0)
        peak_string_title:SetPoint ("topleft", table_frame, "topleft", 505, 0)
        graphic_checkbox_title:SetPoint ("topleft", table_frame, "topleft", 655, 0)

        index_string_title:SetText ("#")
        name_string_title:SetText ("Addon Name")
        total_usage_string_title:SetText ("Total Usage")
        total_psec_string_title:SetText ("Milliseconds")
        total_percent_string_title:SetText ("Percent")
        peak_string_title:SetText ("Peak")
        graphic_checkbox_title:SetText ("Show Graphic")

        local on_enter = function (self)
            self:SetBackdropColor (1, 1, 1, 0.5)
        end

        local on_leave = function (self)
            self:SetBackdropColor (unpack (self.background_color))
        end

        local background1 = {1, 1, 1, 0.3}
        local background2 = {1, 1, 1, 0.0}

        for i = 1, 16 do
            local line = CreateFrame ("frame", "ACUTableFrameLine" .. i, table_frame)
            local y = (i-0) * 21 * -1
            line:SetPoint ("topleft", table_frame, "topleft", 5, y)
            line:SetPoint ("topright", table_frame, "topright", -25, y)
            line:SetHeight (20)
            line:SetScript ("OnEnter", on_enter)
            line:SetScript ("OnLeave", on_leave)

            if (i % 2 == 0) then
                line:SetBackdrop ({bgFile = [[Interface\AddOns\ACU\background]], tileSize = 64})
                line:SetBackdropColor (unpack (background1))
                line.background_color = background1
            else
                line:SetBackdrop ({bgFile = [[Interface\AddOns\ACU\background]], tileSize = 64})
                line:SetBackdropColor (unpack (background2))
                line.background_color = background2
            end

            table_frame.lines [i] = line

            local index_string = line:CreateFontString (nil, "overlay", "GameFontHighlightSmall")
            local name_string = line:CreateFontString (nil, "overlay", "GameFontHighlightSmall")
            local total_usage_string = line:CreateFontString (nil, "overlay", "GameFontHighlightSmall")
            local total_psec_string = line:CreateFontString (nil, "overlay", "GameFontHighlightSmall")
            local total_percent_string = line:CreateFontString (nil, "overlay", "GameFontHighlightSmall")
            local peak_string = line:CreateFontString (nil, "overlay", "GameFontHighlightSmall")

            local icon = line:CreateTexture (nil, "overlay")
            icon:SetSize (16, 16)

            local graphic_checkbox = CreateFrame ("CheckButton", "ACUTableFrameLineCB" .. i, line, "ChatConfigCheckButtonTemplate")
            graphic_checkbox:SetScript ("OnClick", on_click_checkbox)
            graphic_checkbox:SetHitRectInsets (0, 0, 0, 0)
            graphic_checkbox:Hide()

            index_string:SetPoint ("left", line, "left", 2, 0)
            icon:SetPoint ("left", line, "left", 20, 0)
            name_string:SetPoint ("left", icon, "right", 2, 0)
            total_usage_string:SetPoint ("left", line, "left", 200, 0)
            total_psec_string:SetPoint ("left", line, "left", 300, 0)
            total_percent_string:SetPoint ("left", line, "left", 400, 0)
            peak_string:SetPoint ("left", line, "left", 500, 0)
            graphic_checkbox:SetPoint ("left", line, "left", 650, 0)

            line.index = index_string
            line.name = name_string
            line.icon = icon
            line.total_usage = total_usage_string
            line.total_psec = total_psec_string
            line.total_percent = total_percent_string
            line.peak = peak_string
            line.graphic_checkbox = graphic_checkbox
        end

        local update_line = function (t, line, data, index, total_time)
            line.index:SetText (index)

            local addon_name = data [1]
            --local data_broker = LibStub ("LibDataBroker-1.1"):GetDataObjectByName (data [1])
            --print (data_broker, data_broker.icon)

            if (data [4]) then
                line.icon:SetTexture (data [4])
            else
                line.icon:SetTexture (nil)
            end

            line.name:SetText (data [1])

            local psec = data [2] / total_time / 1000
            local color = ACU:GetColor (psec)
            local milliseconds = psec * 1000

            line.total_usage:SetText (color .. format ("%.2fs", data [2] / 1000) .. "|r")
            line.total_psec:SetText (color .. format ("%.2f", milliseconds) .. "|r")
            line.total_percent:SetText (color .. format ("%.2f%%", data [2] / t.total_cpu_by_addons * 100) .. "|r")
            line.graphic_checkbox:SetChecked (t.showing [data [1]])
            line.graphic_checkbox.addon = data [1]
            line.graphic_checkbox:Show()

            line.peak:SetText (format ("%.4fms", data[3].max_value / 1000))

            line:Show()
        end

        local refresh_table_frame = function (self)

            local t = ACU.DataPool [1]

            local offset = FauxScrollFrame_GetOffset (self)

            for name, dataobj in LibStub ("LibDataBroker-1.1"):DataObjectIterator() do
                for i, addon in ipairs (t) do
                    if (addon[1] == name) then
                        addon[4] = dataobj.icon
                        break
                    end
                end
            end

            for bar_index = 1, 16 do
                local line = table_frame.lines [bar_index]
                local data = t [offset + bar_index]

                if (data and data[2] > 0) then
                    update_line (t, line, data, offset + bar_index, t.elapsed_time)
                else
                    line:Hide()
                end
            end

            FauxScrollFrame_Update (self, #t, 16, 21)

        end

        local tfscroll = CreateFrame ("scrollframe", "ACUTableFrameScroll", table_frame, "FauxScrollFrameTemplate")
        tfscroll:SetPoint ("topleft", table_frame, "topleft")
        tfscroll:SetPoint ("bottomright", table_frame, "bottomright", -27, 0)
        tfscroll:SetScript ("OnVerticalScroll", function (self, offset) FauxScrollFrame_OnVerticalScroll (self, offset, 21, refresh_table_frame) end)
        tfscroll.Refresh = refresh_table_frame

        table_frame:Hide()

        --switch button
        local switch_frames = CreateFrame ("button", "ACUProfilerButton", f)
        switch_frames:SetBackdrop ({bgFile = [[Interface\AddOns\ACU\background]], tileSize = 64, edgeFile = [[Interface\AddOns\ACU\border_2]], edgeSize = 16, insets = {left = 1, right = 1, top = 1, bottom = 1}})
        switch_frames:SetBackdropColor (0, 0, 0, 0.4)
        switch_frames:SetBackdropBorderColor (1, 1, 1, 1)
        switch_frames:SetFrameLevel (f:GetFrameLevel()+10)
        switch_frames:SetPoint ("topright", f, "topright", -10, -15)
        switch_frames:SetSize (120, 16)
        switch_frames:SetScript ("OnClick", function (self, button)
            if (table_frame:IsShown()) then
                table_frame:Hide()
                chart:Show()
                self.text:SetText ("Show Table")
                ACU:UpdateChart()
            else
                table_frame:Show()
                chart:Hide()
                self.text:SetText ("Show Graphic")
                ACU:UpdateTableFrame()
            end
        end)

        local t = switch_frames:CreateFontString (nil, "overlay", "GameFontNormal")
        t:SetPoint ("center", switch_frames, "center")
        t:SetText ("Show Table")
        switch_frames.text = t

        -- enable profiler button
        local profiler_icon = f:CreateTexture (nil, "overlay")
        profiler_icon:SetPoint ("bottomleft", f, "bottomleft", 10, 5)
        profiler_icon:SetTexture ([[Interface\DialogFrame\UI-Dialog-Icon-AlertNew]])
        profiler_icon:SetSize (16, 16)

        local profiler_text = f:CreateFontString (nil, "overlay", "GameFontNormal")
        profiler_text:SetPoint ("left", profiler_icon, "right", 5, 1)
        profiler_text:SetJustifyH ("left")

        f.profiler_icon = profiler_icon
        f.profiler_text = profiler_text

        function ACU:ShowProfilerText (flag)
            if (flag) then
                f.profiler_icon:Show()
                f.profiler_text:Show()
            else
                f.profiler_icon:Hide()
                f.profiler_text:Hide()
            end
        end

        local enable_disable = CreateFrame ("button", "ACUProfilerButton", f)
        enable_disable:SetBackdrop ({bgFile = [[Interface\AddOns\ACU\background]], tileSize = 64, edgeFile = [[Interface\AddOns\ACU\border_2]], edgeSize = 16, insets = {left = 1, right = 1, top = 1, bottom = 1}})
        enable_disable:SetBackdropColor (0, 0, 0, 0.4)
        enable_disable:SetBackdropBorderColor (1, 1, 1, 1)
        enable_disable:SetFrameLevel (f:GetFrameLevel()+10)
        enable_disable:SetPoint ("bottomright", f, "bottomright", -10, 5)
        enable_disable:SetSize (120, 16)
        enable_disable:SetScript ("OnClick", function (self, button)
            if (ACU:IsProfileEnabled()) then
                ACU:SetProfileEnabled (false)
                ReloadUI()
            else
                ACU:SetProfileEnabled (true)
                ReloadUI()
            end
        end)

        local t = enable_disable:CreateFontString (nil, "overlay", "GameFontNormal")
        t:SetPoint ("center", enable_disable, "center")
        enable_disable.text = t

        -- on show events
        f:SetScript ("OnShow", function (self)

            if (ACU:IsProfileEnabled()) then
                profiler_text:SetText ("The game client has CPU Profiling enabled! The addon is ready to use.")
                profiler_text:SetTextColor (0.4, 1, 0.4)
                enable_disable.text:SetText ("Stop Profiler")

                if (table_frame:IsShown()) then
                    ACU:UpdateTableFrame()
                elseif (chart:IsShown()) then
                    ACU:UpdateChart()
                end
            else
                profiler_text:SetText ("The game client isn't running CPU Performance Profiler (required by this addon). Click on the button to active:")
                profiler_text:SetTextColor (1, 0.4, 0.4)
                enable_disable.text:SetText ("Start Profiler")

                if (table_frame:IsShown()) then
                    ACU:UpdateTableFrame()
                elseif (chart:IsShown()) then
                    ACU:UpdateChart()
                end
            end
        end)

        --tutorial
        local got_tutorial = ACU.db.profile.first_run
        if (not got_tutorial) then
            local t = CreateFrame ("frame", "ACUProfilerTutorial", f)
            t:SetSize (500, 300)
            t:SetPoint ("center", f, "center")
            t:SetFrameLevel (f:GetFrameLevel()+15)
            t:SetBackdrop ({bgFile = [[Interface\AddOns\ACU\background]], tileSize = 64, edgeFile = [[Interface\AddOns\ACU\border_2]], edgeSize = 16, insets = {left = 1, right = 1, top = 1, bottom = 1}})
            t:SetBackdropColor (0, 0, 0, 0.85)

--            local title_text = t:CreateFontString (nil, "overlay", "GameFontHighlightHuge")
            local title_text = t:CreateFontString (nil, "overlay", "GameFontHighlightLarge")
            title_text:SetPoint ("topleft", t, "topleft", 10, -10)
            title_text:SetText ("How to use:")
            title_text:SetTextColor (1, 1, 0)
            local desc_text = t:CreateFontString (nil, "overlay", "GameFontNormal")
            desc_text:SetPoint ("topleft", t, "topleft", 10, -45)
            desc_text:SetJustifyH ("left")
            desc_text:SetWidth (480)
            --title_text:SetTextColor (1, 1, 0)

            local l = ""
            for _, phrase in ipairs (tutorial_phrases) do
                l = l .. phrase .. "\n\n"
            end
            desc_text:SetText (l)

            local close = CreateFrame ("button", "ACUProfilerTutorialClose", t)
            close:SetBackdrop ({bgFile = [[Interface\AddOns\ACU\background]], tileSize = 64, edgeFile = [[Interface\AddOns\ACU\border_2]], edgeSize = 16, insets = {left = 1, right = 1, top = 1, bottom = 1}})
            close:SetBackdropColor (0, 0, 0, 0.4)
            close:SetBackdropBorderColor (1, 1, 1, 1)
            close:SetFrameLevel (t:GetFrameLevel()+1)
            close:SetPoint ("bottomleft", t, "bottomleft", 10, 5)
            close:SetSize (120, 16)
            close:SetScript ("OnClick", function (self, button)
                t:Hide()
            end)
            local close_text = close:CreateFontString (nil, "overlay", "GameFontNormal")
            close_text:SetPoint ("center", close, "center")
            close_text:SetText ("close")

            local cb = CreateFrame ("CheckButton", "ACUProfilerTutorialCheckBox", t, "ChatConfigCheckButtonTemplate")
            cb:SetScript ("OnClick", function (self)
                if (self:GetChecked()) then
                    ACU.db.profile.first_run = true
                else
                    ACU.db.profile.first_run = false
                end
            end)
            cb:SetPoint ("left", close, "right", 10, 0)
            ACUProfilerTutorialCheckBoxText:SetText ("Don't show this screen again.")
            cb:SetHitRectInsets (0, -200, 0, 0)
        end

        --

        table_frame:Show()
        chart:Hide()
        switch_frames.text:SetText ("Show Graphic")

        f:Hide()
        f:Show()
    end

    -- ~capture
        local on_capturing_screen = CreateFrame ("frame", "ACUProfilerCaptureScreen", UIParent)
        on_capturing_screen:Hide()
        on_capturing_screen:SetFrameStrata ("TOOLTIP")
        on_capturing_screen:SetSize (205, 65)
        on_capturing_screen:SetBackdrop ({bgFile = [[Interface\AddOns\ACU\background]], tileSize = 64, edgeFile = [[Interface\AddOns\ACU\border_2]], edgeSize = 16, insets = {left = 1, right = 1, top = 1, bottom = 1}})
        on_capturing_screen:SetBackdropColor (0, 0, 0, 0.4)
        on_capturing_screen:SetPoint ("bottomleft", UIParent, "bottomleft", 1, 200)

        local icon = on_capturing_screen:CreateTexture (nil, "overlay")
        icon:SetTexture ([[Interface\AddOns\ACU\icon]])
        icon:SetSize (16, 16)
        icon:SetPoint ("topleft", on_capturing_screen, "topleft", 10, -10)
        local title = on_capturing_screen:CreateFontString (nil, "overlay", "GameFontNormal")
        title:SetText ("Capturing Addons Cpu Usage")
        title:SetPoint ("left", icon, "right", 6, 0)

        local statusbar = CreateFrame ("statusbar", "ACUProfilerCaptureScreenStatusbar", on_capturing_screen)
        statusbar:SetPoint ("bottomleft", on_capturing_screen, "bottomleft", 10, 2)
        statusbar:SetPoint ("bottomright", on_capturing_screen, "bottomright", -10, 2)
        statusbar:SetHeight (14)
        statusbar:SetMinMaxValues (0, 100)
        statusbar:SetValue (40)

        local spark = statusbar:CreateTexture (nil, "overlay")
        spark:SetTexture ([[Interface\CastingBar\UI-CastingBar-Spark]])
        spark:SetBlendMode ("ADD")
        statusbar.spark = spark

        local bg = statusbar:CreateTexture (nil, "background")
        bg:SetAllPoints()
        bg:SetTexture (0, 0, 0, 0.4)

        local percent = statusbar:CreateFontString (nil, "overlay", "GameFontNormal")
        percent:SetPoint ("right", statusbar, "right", -2, 0)
        percent:SetText ("40%")

        statusbar.texture = statusbar:CreateTexture (nil, "overlay")
        statusbar.texture:SetTexture ([[Interface\AddOns\ACU\bar_skyline]])
        statusbar:SetStatusBarTexture (statusbar.texture)
        on_capturing_screen.statusbar = statusbar
        on_capturing_screen.percent = percent

        local not_intended = on_capturing_screen:CreateFontString (nil, "overlay", "GameFontHighlightSmall")
        not_intended:SetText ("Not intended? |cFFFF7700Click Here|r")
        not_intended:SetPoint ("center", statusbar, "center", 0, 0)
        not_intended:SetPoint ("bottom", statusbar, "top", 0, 6)
        local disable_profiler = CreateFrame ("button", "ACUProfilerCaptureScreenStopProfilerButton", on_capturing_screen)
        disable_profiler:SetPoint ("topleft", not_intended, "topleft")
        disable_profiler:SetPoint ("bottomright", not_intended, "bottomright")
        disable_profiler:SetScript ("OnClick", function()
            ACU:SetProfileEnabled (false)
        end)

        ACU.capture_panel = on_capturing_screen
    --

    function ACU:UpdateTotalIndicators()
        local total = ACU.DataPool [1].total_cpu_by_addons / 1000
        ACU.totalusage2:SetText (format ("%.2fs", total)) -- .. " (" .. format ("%.1f", total / ACU.DataPool [1].elapsed_time * 100) .. "%)"
        local average = ACU.DataPool [1].total_cpu_by_addons / ACU.DataPool [1].elapsed_time
        ACU.averageusage2:SetText (format ("%.2fms", average))
        ACU.fpsloss2:SetText (format ("%.2ffps", average/16.6))
    end

    function ACU:UpdateTableFrame()

        local t = ACU.DataPool [1]
        if (not t) then
            return
        end

        ACUTableFrameScroll.Refresh (ACUTableFrameScroll)
        ACU:UpdateTotalIndicators()
    end

    local colors = {
        {1, 1, 1}, --white
        {1, 0.8, .4}, --orange
        {.4, 1, .4}, --green
        {1, .4, .4}, --red
        {.4, .4, 1}, --blue
        {.5, 1, 1}, --cyan
        {1, 0.75, 0.79}, --pink
        {0.98, 0.50, 0.44}, --salmon
        {0.75, 0.75, 0.75}, --silver
        {0.60, 0.80, 0.19}, --yellow
        {1, .4, 1}, --magenta
    }
    local default_color = {1, 1, 1}

    function ACU:UpdateChart()

        local t = ACU.DataPool [1]
        if (not t) then
            return
        end

        local elapsed_time = t.elapsed_time

        ACUChartFrame:Reset()

        local i = 1
        for index, addon in ipairs (t) do
            if (t.showing [addon [1]]) then
                ACUChartFrame:AddLine (addon[3], colors [i] or default_color, addon [1], elapsed_time, nil, "SMA")
                i = i + 1
            end
        end

        ACU:UpdateTotalIndicators()
    end

    function ACU:GetColor (amt)
        if (amt >= 0.016) then
            return "|cFFa31313"
        elseif (amt >= 0.012) then
            return "|cFFff9c00"
        elseif (amt >= 0.009) then
            return "|cFFfff000"
        elseif (amt >= 0.006) then
            return "|cFFd8ff00"
        elseif (amt >= 0.004) then
            return "|cFFa2ff00"
        elseif (amt >= 0.002) then
            return "|cFF36ff00"
        else
            return "|cFFc7c7c7"
        end
    end
