local beql = LibStub("AceAddon-3.0"):GetAddon("beql")
local beqlfu    =   beqlfu

-- Init constants
local MODNAME   =   "beql-options-3.0"
local VERSION   =   "0.01"
local MODNAMESTRING =   "bEQL"

local modularOptions    =   {}
local MainOptionsTable = {}

local L = LibStub("AceLocale-3.0"):GetLocale("beql")

local AceConfig =   LibStub("AceConfig-3.0")
local AceConfigReg  =   LibStub("AceConfigRegistry-3.0")
local AceConfigDialog   =   LibStub("AceConfigDialog-3.0")

beql3   =   {}
beql3.optionsFrames =   {}

-- Addon functions

-- Input: nothing
-- Output: nothing
function beql:BlizzardSetupOptions()
    -- if is an Localsation set in Profile, then change the used localisation
    --  if beql.db.profile.locale and L:HasLocale(beql.db.profile.locale) then
    --      L:SetLocale(beql.db.profile.locale)
    --      if BEQL_PostTransFunc[beql.db.profile.locale] then
    --          BEQL_PostTransFunc[beql.db.profile.locale]()
    --      end
    --  end
    -- now let's get the Options

    --get the optiontable and register it
    beql:MainOptionsTable()
    AceConfigReg:RegisterOptionsTable(MODNAMESTRING, MainOptionsTable , MODNAMESTRING)

    -- Mainframe
    beql3.optionsFrames.main    =   AceConfigDialog:AddToBlizOptions(MODNAMESTRING, nil, nil, "general")

    -- Subframes
    beql3.optionsFrames.questlog    =   AceConfigDialog:AddToBlizOptions(MODNAMESTRING, L["Quest Log Options"], MODNAMESTRING, "qlog")
    beql3.optionsFrames.questtracker    =   AceConfigDialog:AddToBlizOptions(MODNAMESTRING, L["Quest Tracker Options"], MODNAMESTRING, "qtracker")
    beql3.optionsFrames.achievement =   AceConfigDialog:AddToBlizOptions(MODNAMESTRING, L["Achievement Tracker"], MODNAMESTRING, "achievement")
    beql3.optionsFrames.tooltip =   AceConfigDialog:AddToBlizOptions(MODNAMESTRING, L["Tooltip"], MODNAMESTRING, "tooltip")
    -- beql3.optionsFrames.qlocales    =   AceConfigDialog:AddToBlizOptions(MODNAMESTRING, L["Pick Locale"], MODNAMESTRING, "qlocales")
    beql3.optionsFrames.fubar   =   AceConfigDialog:AddToBlizOptions(MODNAMESTRING, L["FubarPlugin Config"], MODNAMESTRING, "fubar")
    beql3.optionsFrames.profiles    =   AceConfigDialog:AddToBlizOptions(MODNAMESTRING, L["Profiles"], MODNAMESTRING, "profiles")
    beql3.optionsFrames.About   =   LibStub:GetLibrary("LibAboutPanel").new(MODNAMESTRING, "beql")

    -- Create reload Check
    StaticPopupDialogs["CONFIRM_RELOADUI"]  =   {
        text    =   L["Reload UI ?"],
        button1 =   TEXT(ACCEPT),
        button2 =   TEXT(CANCEL),
        OnAccept    =   function(parentframedata)
            beql:Nyelv("PREV",true)
        end,
        OnCancel    =   function(parentframedata,override)
            -- Do nothing
        end,
        timeout =   20,
        exclusive   =   1,
        notCloseablebyLogout    =   1,
    }

    --[[ -- no need, maybe
    StaticPopupDialogs["CONFIRM_DISABLETRACKER"]    =   {
    text    =   L["Disable Tracker"] .. "? " .. L["Reload UI ?"],
    button1 =   TEXT(ACCEPT),
    button2 =   TEXT(CANCEL),
    OnAccept    =   function(parentframedata)
        beql:Disabletracker("PREV", true)
    end,
    OnCancel    =   function(parentframedata,override)
        -- Do nothing
    end,
    timeout =   20,
    exclusive   =   1,
    notCloseablebyLogout    =   1,
    }--]]

    --[[ -- no need, maybe
    StaticPopupDialogs["CONFIRM_DISABLEADDON"]  =   {
    text    =   L["Reload UI ?"],
    button1 =   TEXT(ACCEPT),
    button2 =   TEXT(CANCEL),
    OnAccept    =   function(parentframedata)
        beql:Disableaddon("PREV", true)
    end,
    OnCancel    =   function(parentframedata,override)
        -- Do nothing
    end,
    timeout =   20,
    exclusive   =   1,
    notCloseablebyLogout    =   1,
    }--]]

    --[[ -- no need, maybe
    StaticPopupDialogs["CONFIRM_SIMPLEQUESTLOG"]    =   {
    text    =   L["Reload UI ?"],
    button1 =   TEXT(ACCEPT),
    button2 =   TEXT(CANCEL),
    OnAccept    =   function(parentframedata)
        beql:DisableQuestLog("PREV", true)
    end,
    OnCancel    =   function(parentframedata,override)
        -- Do nothing
    end,
    timeout =   20,
    exclusive   =   1,
    notCloseablebyLogout    =   1,
    }--]]
end

--[[function beql:RegisterModuleOptions(name, optionsTable, displayName)
    modularOptions[name]    =   optionsTable
    beql3.optionsFrames[name]   =   AceConfigDialog:AddToBlizOptions(MODNAMESTRING, displayName, MODNAMESTRING, name)
end --]]

-- Prepare the Optionstable

-- many many code ....
function beql:MainOptionsTable ()
    MainOptionsTable    =   {
        type    =   'group',
        name    =   MODNAME,
        args    =   {
            -- General Options, shown on the main window
            general =   {
                type    =   'group',
                order   =   1,
                name    =   L["Main Options"],
                desc    =   L["Main Options"],
                args    =   {
                    DisableAddon    =   {
                        type    =   'toggle',
                        order   =   1,
                        width   =   'full',
                        name    =   L["Enable Addon"],
                        desc    =   L["Enable this Addon"],--.." - "..L["Requires Interface Reload"],
                        get =   function(info)
                                    if beql:IsActive() then
                                        return true
                                    else
                                        return false
                                    end
                                end, -- end,
                        set =   function(info, newval) beql:ToggleActive() end, --beql:Disableaddon(newval) end,
                    },
                    Spacher1    =   {
                        type    =   'header',
                        order   =   2,
                        name    =   '',
                    },
                    SimpleQuestLog  =   {
                        type    =   'toggle',
                        order   =   3,
                        name    =   L["Simple Quest Log"],
                        desc    =   L["Uses the default Blizzard Quest Log"],--.." - "..L["Requires Interface Reload"],
                        get =   function(info) return beql.db.profile.simplequestlog end,
                        set =   function(info, newval) beql:ToggleQuestlogStyle(newval) end,
                        disabled    =   function(info) return not beql:IsActive() end,
                    },
                    DisableTracker  =   {
                        type    =   'toggle',
                        order   =   4,
                        width   =   'full',
                        name    =   L["Disable Tracker"],
                        desc    =   L["Disable the Tracker"],--.." - "..L["Requires Interface Reload"],
                        get =   function(info) return beql.db.profile.disabledtracker end,
                        set =   function(info, newval) beql:ToggleQuestTracker(newval) end, --beql:Disabletracker(newval) print (newval) end,
                        disabled    =   function(info) return not beql:IsActive() end,
                    },
                    EnableATracker  =   {
                        type    =   'toggle',
                        order   =   5,
                        width   =   'full',
                        name    =   L["Enable Achievement Tracker"],
                        desc    =   L["Enables the Achievement Tracker, which can be moved an collapsed."] .." - "..L["Requires Interface Reload"],
                        get =   function(info) return beql.db.profile.atracker.Enable end,
                        set =   function(info, newval)
                                        beql.db.profile.atracker.Enable =   newval
                                        if newval then
                                            if not ATracker then
                                                beql:InitAchievementTracker()
                                            end
                                            beql:ATrackerEnable()
                                            beql:AchievementFrameManagePosition()
                                        else
                                            beql:ATrackerDisable()
                                        end
                                    end,
                        disabled    =   function(info) return not beql:IsActive() or true end,
                    },
                },
            },
            -- Quest Log Options
            qlog    =   {
                type    =   'group',
                order   =   2,
                name    =   L["Quest Log Options"],
                desc    =   L["Options related to the Quest Log"],
                    args    =   {
                        Spacing0    =   {
                            type    =   'header',
                            order   =   1,
                            name    =   L["General Quest Log Options"],
                        },
                        Locked  =   {
                            type    =   'toggle',
                            order   =   2,
                            name    =   L["Lock Quest Log"],
                            desc    =   L["Makes the quest log unmovable"],
                            get =   function(info) return beql.db.profile.locked end,
                            set =   function(info, newval) beql:SetMovableQuestlog(newval) end,
                            disabled    =   function(info) return not beql:IsActive() end,
                        },
                        SimpleQuestLog  =   {
                            type    =   'toggle',
                            order   =   3,
                            name    =   L["Simple Quest Log"],
                            desc    =   L["Uses the default Blizzard Quest Log"],--.." - "..L["Requires Interface Reload"],
                            get =   function(info) return beql.db.profile.simplequestlog end,
                            set =   function(info, newval) beql:ToggleQuestlogStyle(newval) end,--beql:DisableQuestLog(newval) end,
                            --disabled  =   function(info) return beql.db.profile.disabled.simplequestlog end,
                            disabled    =   function(info) return not beql:IsActive() end,
                        },
                        Spacing1    =   {
                            type    =   'header',
                            order   =   4,
                            name    =   '',
                        },
                        AlwaysMaximize  =   {
                            type    =   'toggle',
                            order   =   5,
                            width   =   'full',
                            name    =   L["Always Open Maximized"],
                            desc    =   L["Force the quest log to open maximized"],
                            get =   function(info) return beql.db.profile.alwaysmaximize end,
                            set =   function(info, newval) beql.db.profile.alwaysmaximize   =   newval end,
                            disabled    =   function(info) return beql.db.profile.alwaysminimize or (not beql:IsActive()) end,
                        },
                        AlwaysMinimize  =   {
                            type    =   'toggle',
                            order   =   6,
                            width   =   'full',
                            name    =   L["Always Open Minimized"],
                            desc    =   L["Force the quest log to open minimized"],
                            get =   function(info) return beql.db.profile.alwaysminimize end,
                            set =   function(info, newval) beql.db.profile.alwaysminimize   =   newval end,
                            disabled    =   function(info) return beql.db.profile.alwaysmaximize or (not beql:IsActive()) end,
                        },
                        ShowLevel   =   {
                            type    =   'toggle',
                            order   =   7,
                            width   =   'full',
                            name    =   L["Show Quest Level"],
                            desc    =   L["Shows the quests level"],
                            get =   function(info) return beql.db.profile.showlevel end,
                            set =   function(info, newval)
                                            beql.db.profile.showlevel   =   newval
                                            QuestLog_Update()
                                            beql:ManageQuests()
                                            WatchFrame_Update()
                                        end,
                            disabled    =   function(info) return beql.db.profile.disabled.showlevel or (not beql:IsActive()) end,
                        },
                        InfoOnQuestCompletion   =   {
                            type    =   'toggle',
                            order   =   8,
                            width   =   'full',
                            name    =   L["Info on Quest Completion"],
                            desc    =   L["Shows a message and plays a sound when you complete a quest"],
                            get =   function(info) return beql.db.profile.InfoOnQuestCompletion end,
                            set =   function(info, newval) beql.db.profile.InfoOnQuestCompletion = newval end,
                            disabled    =   function(info) return not beql:IsActive() end,
                        },
                        QuestCompletionSound    =   {
                            type    =   'group',
                            order   =   9,
                            guiInline   =   true,
                            width   =   'full',
                            name    =   L["Completion Sound"],
                            desc    =   L["Select the sound to be played when a quest is completed"],
                            disabled    =   function(info) return not beql.db.profile.InfoOnQuestCompletion or (not beql:IsActive()) end,
                            args    =   {
                                none    =   {
                                    type    =   'toggle',
                                    order   =   1,
                                    width   =   'full',
                                    name    =   L["No sound"],
                                    desc    =   L["Don't play a sound"],
                                    get =   function(info) if not beql.db.profile.InfoSound or beql.db.profile.InfoSound == '' then return true else return false end end,
                                    set =   function(info, newval) if newval then beql.db.profile.InfoSound =   '' end end,
                                },
                            }
                        },
                        AnnounceQuestStatus =   {
                            type    =   'toggle',
                            order   =   10,
                            width   =   'full',
                            name    =   L["Quest Progression to Party Chat"],
                            desc    =   L["Prints the Quest Progression Status to the Party Chat"],
                            get =   function(info) return beql.db.profile.AnnounceQuest end,
                            set =   function(info, newval) beql.db.profile.AnnounceQuest    =   newval end,
                            disabled    =   function(info) return not beql:IsActive() end,
                        },
                        AutoComplete    =   {
                            type    =   'toggle',
                            order   =   11,
                            width   =   'full',
                            name    =   L["Auto Complete Quest"],
                            desc    =   L["Automatically Complete Quests"],
                            get =   function(info) return beql.db.profile.autocomplete end,
                            set =   function(info, newval) beql.db.profile.autocomplete =   newval end,
                            disabled    =   function(info) return not beql:IsActive() end,
                        },
                        QuestLogAlpha   =   {
                            type    =   'range',
                            order   =   12,
                            width   =   'full',
                            name    =   L["Quest Log Alpha"],
                            desc    =   L["Sets the Alpha of the Quest Log"],
                            get =   function(info)
                                return beql.db.profile.QuestLogAlpha
                            end,
                            set =   function(info, newval)
                                                    beql.db.profile.QuestLogAlpha   =   newval
                                                    QuestLogFrame:SetAlpha(beql.db.profile.QuestLogAlpha)
                            end,
                            min =   0,
                            max =   1,
                            step    =   0.01,
                            disabled    =   function(info) return not beql:IsActive() end,
                        },
                        QuestLogFontSize    =   {
                            type    =   'range',
                            order   =   13,
                            width   =   'full',
                            name    =   L["Font Size"],
                            desc    =   L["Font Size"],
                            get =   function(info) return beql.db.profile.QuestLogFontSize end,
                            set =   function(info, newval)
                                beql.db.profile.QuestLogFontSize    =   newval
                                beql:SetQuestLogFontSize(newval)
                            end,
                            min =   6,
                            max =   20,
                            step    =   1,
                            disabled    =   function(info) return not beql:IsActive() end,
                        },
                        QuestLogScale   =   {
                            type    =   'range',
                            order   =   14,
                            width   =   'full',
                            name    =   L["Quest Log Scale"],
                            desc    =   L["Sets the Scale of the Quest Log"],
                            get =   function(info)
                                        return beql.db.profile.QuestLogScale
                                    end,
                            set =   function(info, newval)
                                        beql.db.profile.QuestLogScale   =   newval
                                        QuestLogFrame:SetScale(beql.db.profile.QuestLogScale)
                                    end,
                            min =   0.4,
                            max =   1.5,
                            step    =   0.01,
                            disabled    =   function(info) return not beql:IsActive() end,
                        },
                },
            },
            -- Questtracker Options
            qtracker    =   {
                type    =   'group',
                order   =   3,
                name    =   L["Disable Tracker"],
                desc    =   L["Disable the Tracker"],--.." - "..L["Requires Interface Reload"],
                args    =   {
                    LockedTracker   =   {
                        type    =   'toggle',
                        order   =   1,
                        name    =   L["Lock Tracker"],
                        desc    =   L["Makes the quest tracker unmovable"],
                        get =   function(info) return beql.db.profile.lockedtracker end,
                        set =   function(info, newval)
                                    beql:SetMovableQuestTracker(newval)
                                end,
                        disabled    =   function(info) return beql.db.profile.disabled.lockedtracker end,
                    },
                    ResetTracker    =   {
                        type    =   'execute',
                        order   =   2,
                        name    =   L["Reset tracker position"],
                        desc    =   L["Reset tracker position"],
                        func    =   function(info)
                                        beql:SetQWFPosDefault()
                                        beql:SavePositionTracker()
                                    end
                    },
                    Spacing1    =   {
                        type    =   'header',
                        order   =   3,
                        name    =   '',
                        },
                    ShowTrackerHeader   =   {
                        type    =   'toggle',
                        order   =   4,
                        width   =   'full',
                        name    =   L["Show Tracker Header"],
                        desc    =   L["Shows the trackers header"],
                        get =   function(info) return beql.db.profile.ShowTrackerHeader end,
                        set =   function(info, newval) beql.db.profile.ShowTrackerHeader    =   newval WatchFrame_Update() end,
                    },
                    TrackerAutoResize   =   {
                        type    =   'toggle',
                        order   =   5,
                        width   =   'full',
                        name    =   L["Auto Resize Tracker"],
                        desc    =   L["Automatical resizes the tracker depending on the lenght of the text in it"],
                        get =   function(info) return beql.db.profile.TrackerAutoResize end,
                        set =   function(info, newval) beql.db.profile.TrackerAutoResize    =   newval WatchFrame_Update() end,
                    },
                    TrackerFixedWidth   =   {
                        type    =   'range',
                        order   =   6,
                        width   =   'full',
                        name    =   L["Fixed Tracker Width"],
                        desc    =   L["Sets the fixed width of the tracker if auto resize is disabled"],
                        get =   function(info) return beql.db.profile.TrackerFixedWidth end,
                        set =   function(info, newval) beql.db.profile.TrackerFixedWidth    =   newval WatchFrame_Update() end,
                        min =   200,
                        max =   600,
                        step    =   10,
                        disabled    =   function(info) return beql.db.profile.TrackerAutoResize end,
                    },
                    TrackerFontHeight   =   {
                        type    =   'range',
                        order   =   7,
                        width   =   'full',
                        name    =   L["Font Size"],
                        desc    =   L["Changes the font size of the tracker"],
                        get =   function(info)
                                    return beql.db.profile.TrackerFontHeight
                                end,
                        set =   function(info, newval)
                                    beql.db.profile.TrackerFontHeight   =   newval
                                    WatchFrame_Update()
                                end,
                        min =   8,
                        max =   18,
                        step    =   1,
                    },
                    QuestTrackerAlpha   =   {
                        type    =   'range',
                        order   =   8,
                        name    =   L["Quest Tracker Alpha"],
                        desc    =   L["Sets the Alpha of the Quest Tracker"],
                        get =   function(info)
                                    return beql.db.profile.QuestTrackerAlpha
                                end,
                        set =   function(info, newval)
                                    beql.db.profile.QuestTrackerAlpha   =   newval
                                    QuestWatchFrame:SetAlpha(beql.db.profile.QuestTrackerAlpha)
                                end,
                        min =   0,
                        max =   1,
                        step    =   0.01,
                    },
                    Spacing2    =   {
                        type    =   'header',
                        order   =   9,
                        name    =   '',
                    },
                    AddNew  =   {
                        type    =   'toggle',
                        order   =   10,
                        width   =   'full',
                        name    =   L["Add New Quests"],
                        desc    =   L["Automatical add new Quests to tracker"],
                        get =   function(info) return beql.db.profile.AddNew end,
                        set =   function(info, newval) beql.db.profile.AddNew   =   newval WatchFrame_Update() end,
                    },
                    AddUntracked    =   {
                        type    =   'toggle',
                        order   =   11,
                        width   =   'full',
                        name    =   L["Add Untracked"],
                        desc    =   L["Automatical add quests with updated objectives to tracker"],
                        get =   function(info) return beql.db.profile.AddUntracked end,
                        set =   function(info, newval)
                            beql.db.profile.AddUntracked    =   newval;
                            -- disable, use Quixote
                            -- if newval then
                            --     AUTO_QUEST_WATCH    =   "1"
                            -- else
                            --     AUTO_QUEST_WATCH    =   "0"
                            -- end
                            WatchFrame_Update()
                        end,
                    },
                    Spacing3    =   {
                        type    =   'header',
                        order   =   12,
                        name    =   '',
                    },
                    ShowZonesInTracker  =   {
                        order   =   13,
                        type    =   'toggle',
                        width   =   'full',
                        name    =   L["Show Quest Zones"],
                        desc    =   L["Show the quests zone it belongs to above its name"],
                        get =   function(info) return beql.db.profile.ShowZonesInTracker end,
                        set =   function(info, newval) beql.db.profile.ShowZonesInTracker   =   newval WatchFrame_Update() end,
                    },
                    Spacing4    =   {
                        type    =   'header',
                        order   =   14,
                        name    =   L["Watch Options"],
                    },
                    RemoveFinished  =   {
                        type    =   'toggle',
                        order   =   15,
                        width   =   'full',
                        name    =   L["Remove Completed Quests"],
                        desc    =   L["Automatical remove completed quests from tracker"],
                        get =   function(info) return beql.db.profile.RemoveFinished end,
                        set =   function(info, newval) beql.db.profile.RemoveFinished   =   newval WatchFrame_Update() end,
                    },
                    MinimizeFinished    =   {
                        type    =   'toggle',
                        order   =   16,
                        width   =   'full',
                        name    =   L["Hide Completed Objectives"],
                        desc    =   L["Automatical hide completed objectives in tracker"],
                        get =   function(info) return beql.db.profile.MinimizeFinished end,
                        set =   function(info, newval) beql.db.profile.MinimizeFinished =   newval WatchFrame_Update() end,
                    },
                    HideCompletedOnly   =   {
                        type    =   'toggle',
                        order   =   17,
                        width   =   'full',
                        name    =   L["Hide Objectives for Completed only"],
                        desc    =   L["Hide objectives only for completed quests"],
                        get =   function(info) return beql.db.profile.HideCompletedOnly end,
                        set =   function(info, newval) beql.db.profile.HideCompletedOnly    =   newval WatchFrame_Update() end,
                        disabled    =   function(info) return beql.db.profile.MinimizeFinished or beql.db.profile.RemoveFinished end,
                    },
                    SortTrackerItems    =   {
                        type    =   'toggle',
                        order   =   18,
                        width   =   'full',
                        name    =   L["Sort Tracker Quests"],
                        desc    =   L["Sort the quests in tracker"],
                        get =   function(info) return beql.db.profile.SortTrackerItems end,
                        set =   function(info, newval) beql.db.profile.SortTrackerItems =   newval beql:SortWatchedQuests() WatchFrame_Update() end,
                    },
                    Spacing5    =   {
                        type    =   'header',
                        order   =   19,
                        name    =   L["Markers"],
                    },
                    -- Marker Options on Questtracker
                    MarkerOptions   =   {
                        type    =   'group',
                        order   =   20,
                        guiInline   =   true,
                        name    =   '',--L["Markers"],
                        desc    =   L["Customize the Objective/Quest Markers"],
                        args    =   {
                            ShowObjectiveMarkers    =   {
                                type    =   'toggle',
                                order   =   1,
                                name    =   L["Show Objective Markers"],
                                desc    =   L["Display Markers before objectives"],
                                get =   function(info) return beql.db.profile.ShowObjectiveMarkers end,
                                set =   function(info, newval) beql.db.profile.ShowObjectiveMarkers =   newval WatchFrame_Update() end,
                                disabled    =   function(info) return beql.db.profile.disabled.markers end,
                            },
                            TrackerSymbol   =   {
                                type    =   'range',
                                order   =   2,
                                name    =   L["Symbol Type"],
                                desc    =   L["Set the type of symbol"],
                                get =   function(info)
                                            return beql.db.profile.TrackerSymbol
                                        end,
                                set =   function(info, newval)
                                            beql.db.profile.TrackerSymbol   =   newval
                                            WatchFrame_Update()
                                        end,
                                min =   0,
                                max =   3,
                                step    =   1,
                                disabled    =   function(info) return beql.db.profile.UseTrackerListing or not beql.db.profile.ShowObjectiveMarkers end,
                            },
                            UseTrackerListing   =   {
                                type    =   'toggle',
                                order   =   3,
                                name    =   L["Use Listing"],
                                desc    =   L["User Listing rather than symbols"],
                                get =   function(info) return beql.db.profile.UseTrackerListing end,
                                set =   function(info, newval) beql.db.profile.UseTrackerListing    =   newval WatchFrame_Update() end,
                                disabled    =   function(info) return not beql.db.profile.ShowObjectiveMarkers end,
                            },
                            TrackerList =   {
                                type    =   'range',
                                order   =   4,
                                name    =   L["List Type"],
                                desc    =   L["Set the type of listing"],
                                get =   function(info)
                                            return beql.db.profile.TrackerList
                                        end,
                                set =   function(info, newval)
                                            beql.db.profile.TrackerList =   newval
                                            WatchFrame_Update()
                                        end,
                                min =   0,
                                max =   3,
                                step    =   1,
                                disabled    =   function(info) return not beql.db.profile.UseTrackerListing end,
                            },
                        },
                    },
                    Spacing6    =   {
                        type    =   'header',
                        order   =   21,
                        name    =   L["Colors"],
                    },
                    -- Colors on Questtracker
                    Colors  =   {
                        type    =   'group',
                        guiInline   =   true,
                        name    =   '',
                        desc    =   L["Set tracker Colors"],
                        order   =   22,
                        args    =   {
                            BackgroundAlpha =   {
                                type    =   'toggle',
                                order   =   1,
                                name    =   L["Background"],
                                desc    =   L["Use Background"],
                                get =   function(info) return beql.db.profile.BackgroundAlpha end,
                                set =   function(info, newval) beql.db.profile.BackgroundAlpha  =   newval WatchFrame_Update() end,
                            },
                            CustomBackgroundColor   =   {
                                type    =   'toggle',
                                order   =   2,
                                name    =   L["Custom Background Color"],
                                desc    =   L["Use custom color for background"],
                                get =   function(info) return beql.db.profile.CustomBackgroundColor end,
                                set =   function(info, newval) beql.db.profile.CustomBackgroundColor    =   newval WatchFrame_Update() end,
                                disabled    =   function(info) return not beql.db.profile.BackgroundAlpha end,
                            },
                            BackgroundColor =   {
                                type    =   'color',
                                order   =   3,
                                name    =   L["Background Color"],
                                desc    =   L["Sets the Background Color"],
                                get =   function(info)
                                            return beql.db.profile.Color.BackgroundColor.r, beql.db.profile.Color.BackgroundColor.g, beql.db.profile.Color.BackgroundColor.b, beql.db.profile.Color.BackgroundColor.a
                                        end,
                                set =   function(info, r, g, b, a)
                                            beql.db.profile.Color.BackgroundColor.r =   r
                                            beql.db.profile.Color.BackgroundColor.g =   g
                                            beql.db.profile.Color.BackgroundColor.b =   b
                                            beql.db.profile.Color.BackgroundColor.a =   a
                                            WatchFrame_Update()
                                        end,
                                hasAlpha    =   true,
                                disabled    =   function(info) return not beql.db.profile.CustomBackgroundColor end,
                            },
                            BackgroundCornerColor   =   {
                                type    =   'color',
                                order   =   4,
                                name    =   L["Background Corner Color"],
                                desc    =   L["Sets the Background Corner Color"],
                                get =   function(info)
                                            return beql.db.profile.Color.BackgroundCornerColor.r, beql.db.profile.Color.BackgroundCornerColor.g, beql.db.profile.Color.BackgroundCornerColor.b, beql.db.profile.Color.BackgroundCornerColor.a
                                        end,
                                set =   function(info, r, g, b, a)
                                            beql.db.profile.Color.BackgroundCornerColor.r   =   r
                                            beql.db.profile.Color.BackgroundCornerColor.g   =   g
                                            beql.db.profile.Color.BackgroundCornerColor.b   =   b
                                            beql.db.profile.Color.BackgroundCornerColor.a   =   a
                                            WatchFrame_Update()
                                        end,
                                hasAlpha    =   true,
                                disabled    =   function(info) return not beql.db.profile.CustomBackgroundColor end,
                            },
                            spacer1 =   {
                                            type    =   'header',
                                            order   =   5,
                                            name    =   L["Zones"],
                                        },
                            CustomZoneColor =   {
                                type    =   'toggle',
                                order   =   6,
                                name    =   L["Custom Zone Color"],
                                desc    =   L["Use custom color for Zone names"],
                                get =   function(info) return beql.db.profile.CustomZoneColor end,
                                set =   function(info, newval) beql.db.profile.CustomZoneColor  =   newval WatchFrame_Update() end,
                            },
                            ColorZone   =   {
                                type    =   'color',
                                order   =   7,
                                name    =   L["Zone Color"],
                                desc    =   L["Sets the zone color"],
                                get =   function(info)
                                                return beql.db.profile.Color.Zone.r, beql.db.profile.Color.Zone.g, beql.db.profile.Color.Zone.b, beql.db.profile.Color.Zone.a
                                end,
                                set =   function(info, r, g, b, a)
                                                beql.db.profile.Color.Zone.r    =   r
                                                beql.db.profile.Color.Zone.g    =   g
                                                beql.db.profile.Color.Zone.b    =   b
                                                beql.db.profile.Color.Zone.a    =   a
                                                WatchFrame_Update()
                                end,
                                hasAlpha    =   false,
                                disabled    =   function(info) return not beql.db.profile.CustomZoneColor end,
                            },
                            spacer2 =   {
                                            type    =   'header',
                                            order   =   8,
                                            name    =   '',
                                        },
                            FadeColor   =   {
                                type    =   'toggle',
                                order   =   9,
                                name    =   L["Fade Colors"],
                                desc    =   L["Fade the objective colors"],
                                get =   function(info) return beql.db.profile.FadeColor end,
                                set =   function(info, newval) beql.db.profile.FadeColor    =   newval WatchFrame_Update() end,
                            },
                            CustomObjetiveColor =   {
                                type    =   'toggle',
                                order   =   10,
                                name    =   L["Custom Objective Color"],
                                desc    =   L["Use custom color for objective text"],
                                get =   function(info) return beql.db.profile.CustomObjetiveColor end,
                                set =   function(info, newval) beql.db.profile.CustomObjetiveColor  =   newval WatchFrame_Update() end,
                            },
                            ColorObjectiveEmpty =   {
                                type    =   'color',
                                order   =   11,
                                name    =   L["Objective Color"],
                                desc    =   L["Sets the color for objectives"],
                                get =   function(info)
                                                return beql.db.profile.Color.ObjectiveEmpty.r, beql.db.profile.Color.ObjectiveEmpty.g, beql.db.profile.Color.ObjectiveEmpty.b, beql.db.profile.Color.ObjectiveEmpty.a
                                end,
                                set =   function(info, r, g, b, a)
                                                beql.db.profile.Color.ObjectiveEmpty.r  =   r
                                                beql.db.profile.Color.ObjectiveEmpty.g  =   g
                                                beql.db.profile.Color.ObjectiveEmpty.b  =   b
                                                beql.db.profile.Color.ObjectiveEmpty.a  =   a
                                                WatchFrame_Update()
                                end,
                                hasAlpha    =   false,
                                disabled    =   function(info) return not beql.db.profile.CustomObjetiveColor end,
                            },
                            ColorObjectiveComplete  =   {
                                type    =   'color',
                                order   =   12,
                                name    =   L["Completed Objective Color"],
                                desc    =   L["Sets the color for completed objectives"],
                                get =   function(info)
                                                return beql.db.profile.Color.ObjectiveComplete.r, beql.db.profile.Color.ObjectiveComplete.g, beql.db.profile.Color.ObjectiveComplete.b, beql.db.profile.Color.ObjectiveComplete.a
                                end,
                                set =   function(info, r, g, b, a)
                                                beql.db.profile.Color.ObjectiveComplete.r   =   r
                                                beql.db.profile.Color.ObjectiveComplete.g   =   g
                                                beql.db.profile.Color.ObjectiveComplete.b   =   b
                                                beql.db.profile.Color.ObjectiveComplete.a   =   a
                                                WatchFrame_Update()
                                end,
                                hasAlpha    =   false,
                                disabled    =   function(info) return not beql.db.profile.CustomObjetiveColor end,
                            },
                            spacer3 =   {
                                            type    =   'header',
                                            order   =   13,
                                            name    =   '',
                                        },


                            CustomHeaderColor   =   {
                                type    =   'toggle',
                                order   =   14,
                                name    =   L["Custom Header Color"],
                                desc    =   L["Use custom color for headers"],
                                get =   function(info) return beql.db.profile.CustomHeaderColor end,
                                set =   function(info, newval) beql.db.profile.CustomHeaderColor    =   newval WatchFrame_Update() end,
                            },
                            HeaderQuestLevelColor   =   {
                                type    =   'toggle',
                                order   =   15,
                                name    =   L["Use Quest Level Colors"],
                                desc    =   L["Use the colors to indicate quest difficulty"],
                                get =   function(info) return beql.db.profile.HeaderQuestLevelColor end,
                                set =   function(info, newval) beql.db.profile.HeaderQuestLevelColor    =   newval WatchFrame_Update() end,
                                disabled    =   function(info) return not beql.db.profile.CustomHeaderColor end,
                            },
                            ColorHeaderEmpty    =   {
                                type    =   'color',
                                order   =   16,
                                name    =   L["Header Color"],
                                desc    =   L["Sets the color for headers"],
                                get =   function(info)
                                                return beql.db.profile.Color.HeaderEmpty.r, beql.db.profile.Color.HeaderEmpty.g, beql.db.profile.Color.HeaderEmpty.b, beql.db.profile.Color.HeaderEmpty.a
                                end,
                                set =   function(info, r, g, b, a)
                                                beql.db.profile.Color.HeaderEmpty.r =   r
                                                beql.db.profile.Color.HeaderEmpty.g =   g
                                                beql.db.profile.Color.HeaderEmpty.b =   b
                                                beql.db.profile.Color.HeaderEmpty.a =   a
                                                WatchFrame_Update()
                                end,
                                hasAlpha    =   false,
                                disabled    =   function(info) return not beql.db.profile.CustomHeaderColor or beql.db.profile.HeaderQuestLevelColor end,
                            },
                            ColorHeaderComplete =   {
                                type    =   'color',
                                order   =   17,
                                name    =   L["Completed Header Color"],
                                desc    =   L["Sets the color for completed headers"],
                                get =   function(info)
                                                return beql.db.profile.Color.HeaderComplete.r, beql.db.profile.Color.HeaderComplete.g, beql.db.profile.Color.HeaderComplete.b, beql.db.profile.Color.HeaderComplete.a
                                end,
                                set =   function(info, r, g, b, a)
                                                beql.db.profile.Color.HeaderComplete.r  =   r
                                                beql.db.profile.Color.HeaderComplete.g  =   g
                                                beql.db.profile.Color.HeaderComplete.b  =   b
                                                beql.db.profile.Color.HeaderComplete.a  =   a
                                                WatchFrame_Update()
                                end,
                                hasAlpha    =   false,
                                disabled    =   function(info) return not beql.db.profile.CustomHeaderColor end,
                            },
                            ColorHeaderFailed   =   {
                                type    =   'color',
                                order   =   18,
                                name    =   L["Failed Header Color"],
                                desc    =   L["Sets the color for failed quests"],
                                get =   function(info)
                                                return beql.db.profile.Color.HeaderFailed.r, beql.db.profile.Color.HeaderFailed.g, beql.db.profile.Color.HeaderFailed.b, beql.db.profile.Color.HeaderFailed.a
                                end,
                                set =   function(info, r, g, b, a)
                                                beql.db.profile.Color.HeaderFailed.r    =   r
                                                beql.db.profile.Color.HeaderFailed.g    =   g
                                                beql.db.profile.Color.HeaderFailed.b    =   b
                                                beql.db.profile.Color.HeaderFailed.a    =   a
                                                WatchFrame_Update()
                                end,
                                hasAlpha    =   false,
                                disabled    =   function(info) return not beql.db.profile.CustomHeaderColor end,
                            }
                        },
                    },
                },
            },
            -- Tooltip Options
            tooltip =   {
                type    =   'group',
                order   =   4,
                name    =   L["Tooltip"],
                desc    =   L["Tooltip Options"],
                args    =   {
                    TooltipMob  =   {
                        type    =   'toggle',
                        order   =   1,
                        width   =   'full',
                        name    =   L["Mob Tooltip Quest Info"],
                        desc    =   L["Show quest info in mob tooltips"],
                        get =   function(info) return beql.db.profile.tooltipmob end,
                        set =   function(info, newval) beql.db.profile.tooltipmob   =   newval end,
                    },
                    TooltipItem =   {
                        type    =   'toggle',
                        order   =   2,
                        width   =   'full',
                        name    =   L["Item Tooltip Quest Info"],
                        desc    =   L["Show quest info in item tooltips"],
                        get =   function(info) return beql.db.profile.tooltipitem end,
                        set =   function(info, newval) beql.db.profile.tooltipitem  =   newval end,
                    },
                    Spacer1 =   {
                                type    =   'header',
                                order   =   3,
                                name    =   L["Quest Tracker"],
                            },
                            ActiveTracker   =   {
                        type    =   'toggle',
                        order   =   4,
                        width   =   'full',
                        name    =   L["Tracker Tooltip"],
                        desc    =   L["Showing mouseover tooltips in tracker"],
                        get =   function(info) return beql.db.profile.activetracker end,
                        set =   function(info, newval) beql.db.profile.activetracker    =   newval beql:CheckMouseEvents() end,
                    },
                    TrackerTooltipDesc  =   {
                        type    =   'toggle',
                        order   =   5,
                        width   =   'full',
                        name    =   L["Quest Description in Tracker Tooltip"],
                        desc    =   L["Displays the actual quest's description in the tracker tooltip"],
                        get =   function(info) return beql.db.profile.activetrackerdesc end,
                        set =   function(info, newval) beql.db.profile.activetrackerdesc    =   newval end,
                        disabled    =   function(info) return not beql.db.profile.activetracker end,
                    },
                    TrackerTooltipParty =   {
                        type    =   'toggle',
                        order   =   6,
                        width   =   'full',
                        name    =   L["Party Quest Progression info"],
                        desc    =   L["Displays Party members quest status in the tooltip - Quixote must be installed on the partymembers client"],
                        get =   function(info) return beql.db.profile.activetrackerparty end,
                        set =   function(info, newval) beql.db.profile.activetrackerparty   =   newval end,
                        disabled    =   function(info) return not beql.db.profile.activetracker end,
                    },
                    TrackerMouseLeft    =   {
                        type    =   'toggle',
                        order   =   7,
                        name    =   L["Enable Left Click"],
                        desc    =   L["Left clicking a quest in the tracker opens the Quest Log"],
                        get =   function(info) return beql.db.profile.activetrackerleft end,
                        set =   function(info, newval) beql.db.profile.activetrackerleft    =   newval beql:CheckMouseEvents() end,
                    },
                    TrackerMouseRight   =   {
                        type    =   'toggle',
                        order   =   8,
                        name    =   L["Enable Right Click"],
                        desc    =   L["Right clicking a quest in the tracker removes it from the tracker"],
                        get =   function(info) return beql.db.profile.activetrackerright end,
                        set =   function(info, newval) beql.db.profile.activetrackerright   =   newval beql:CheckMouseEvents() end,
                    },
                    Spacer2 =   {
                                type    =   'header',
                                order   =   9,
                        name    =   L["Colors"],
                            },
                    Colors  =   {
                        type    =   'group',
                                order   =   10,
                        guiInline   =   true,
                                name    =   '',
                        desc    =   L["Colors"],
                        args    =   {
                            ColorDesc   =   {
                                type    =   'color',
                                order   =   1,
                                name    =   L["Quest Description Color"],
                                desc    =   L["Sets the color for the Quest description"],
                                get =   function(info)
                                            return beql.db.profile.Color.TooltipDesc.r,
                                                    beql.db.profile.Color.TooltipDesc.g,
                                                    beql.db.profile.Color.TooltipDesc.b,
                                                    beql.db.profile.Color.TooltipDesc.a
                                end,
                                set =   function(info, r, g, b, a)
                                            beql.db.profile.Color.TooltipDesc.r =   r
                                            beql.db.profile.Color.TooltipDesc.g =   g
                                            beql.db.profile.Color.TooltipDesc.b =   b
                                            beql.db.profile.Color.TooltipDesc.a =   a
                                end,
                                hasAlpha    =   false,
                            },
                            ColorPartyQ =   {
                                type    =   'color',
                                order   =   2,
                        width   =   'full',
                                name    =   L["Party Member with Quixote Color"],
                                desc    =   L["Sets the color for Party member"],
                                get =   function(info)
                                            return beql.db.profile.Color.TooltipPartyQuixote.r,
                                                    beql.db.profile.Color.TooltipPartyQuixote.g,
                                                    beql.db.profile.Color.TooltipPartyQuixote.b,
                                                    beql.db.profile.Color.TooltipPartyQuixote.a
                                end,
                                set =   function(info, r, g, b, a)
                                            beql.db.profile.Color.TooltipPartyQuixote.r =   r
                                            beql.db.profile.Color.TooltipPartyQuixote.g =   g
                                            beql.db.profile.Color.TooltipPartyQuixote.b =   b
                                            beql.db.profile.Color.TooltipPartyQuixote.a =   a
                                end,
                                hasAlpha    =   false,
                            },
                            ColorPartyNQ    =   {
                                type    =   'color',
                                order   =   3,
                        width   =   'full',
                                name    =   L["Party Member Color"],
                                desc    =   L["Sets the color for Party member"],
                                get =   function(info)
                                            return beql.db.profile.Color.TooltipPartyNonQuixote.r,
                                                    beql.db.profile.Color.TooltipPartyNonQuixote.g,
                                                    beql.db.profile.Color.TooltipPartyNonQuixote.b,
                                                    beql.db.profile.Color.TooltipPartyNonQuixote.a
                                end,
                                set =   function(info, r, g, b, a)
                                            beql.db.profile.Color.TooltipPartyNonQuixote.r  =   r
                                            beql.db.profile.Color.TooltipPartyNonQuixote.g  =   g
                                            beql.db.profile.Color.TooltipPartyNonQuixote.b  =   b
                                            beql.db.profile.Color.TooltipPartyNonQuixote.a  =   a
                                end,
                                hasAlpha    =   false,
                            },
                            ColorPartyObj   =   {
                                type    =   'color',
                                order   =   4,
                        width   =   'full',
                                name    =   L["Objective Color"],
                                desc    =   L["Sets the color for objectives"],
                                get =   function(info)
                                            return beql.db.profile.Color.TooltipPartyObj.r,
                                                    beql.db.profile.Color.TooltipPartyObj.g,
                                                    beql.db.profile.Color.TooltipPartyObj.b,
                                                    beql.db.profile.Color.TooltipPartyObj.a
                                end,
                                set =   function(info, r, g, b, a)
                                            beql.db.profile.Color.TooltipPartyObj.r =   r
                                            beql.db.profile.Color.TooltipPartyObj.g =   g
                                            beql.db.profile.Color.TooltipPartyObj.b =   b
                                            beql.db.profile.Color.TooltipPartyObj.a =   a
                                end,
                                hasAlpha    =   false,
                            },
                            ColorPartyObj   =   {
                                type    =   'color',
                                order   =   5,
                        width   =   'full',
                                name    =   L["Completed Objective Color"],
                                desc    =   L["Sets the color for completed objectives"],
                                get =   function(info)
                                            return beql.db.profile.Color.TooltipPartyObjComp.r,
                                                    beql.db.profile.Color.TooltipPartyObjComp.g,
                                                    beql.db.profile.Color.TooltipPartyObjComp.b,
                                                    beql.db.profile.Color.TooltipPartyObjComp.a
                                end,
                                set =   function(info, r, g, b, a)
                                            beql.db.profile.Color.TooltipPartyObjComp.r =   r
                                            beql.db.profile.Color.TooltipPartyObjComp.g =   g
                                            beql.db.profile.Color.TooltipPartyObjComp.b =   b
                                            beql.db.profile.Color.TooltipPartyObjComp.a =   a
                                end,
                                hasAlpha    =   false,
                            },
                            ColorObjFade    =   {
                                type    =   'toggle',
                                order   =   7,
                        width   =   'full',
                                name    =   L["Fade Colors"],
                                desc    =   L["Fade Colors"],
                                get =   function(info) return beql.db.profile.TooltipObjFade end,
                                set =   function(info, newval) beql.db.profile.TooltipObjFade   =   newval end,
                            },
                            Spacer1 =   {
                                            type    =   'header',
                                            order   =   8,
                                            name    =   L["NPC color"],
                                    },
                            TooltipItemFade =   {
                                type    =   'toggle',
                                order   =   9,
                                        width   =   'full',
                                name    =   L["Use Quest Level Colors"],
                                desc    =   L["Use Quest Level Colors"],
                                get =   function(info) return beql.db.profile.TooltipItemFade end,
                                set =   function(info, newval) beql.db.profile.TooltipItemFade  =   newval end,
                            },
                            ColorMobTooltip =   {
                                type    =   'color',
                                order   =   10,
                                name    =   L["Mob Tooltip Quest Info"],
                                desc    =   L["Mob Tooltip Quest Info"],
                                get =   function(info)
                                            return beql.db.profile.Color.ColorMobTooltip.r,
                                                    beql.db.profile.Color.ColorMobTooltip.g,
                                                    beql.db.profile.Color.ColorMobTooltip.b,
                                                    beql.db.profile.Color.ColorMobTooltip.a
                                end,
                                set =   function(info, r, g, b, a)
                                            beql.db.profile.Color.ColorMobTooltip.r =   r
                                            beql.db.profile.Color.ColorMobTooltip.g =   g
                                            beql.db.profile.Color.ColorMobTooltip.b =   b
                                            beql.db.profile.Color.ColorMobTooltip.a =   a
                                end,
                                hasAlpha    =   false,
                                disabled    =   function(info) return beql.db.profile.TooltipItemFade end,
                            },
                            ColorItemTooltip    =   {
                                type    =   'color',
                                order   =   11,
                                name    =   L["Item Tooltip Quest Info"],
                                desc    =   L["Item Tooltip Quest Info"],
                                get =   function(info)
                                            return beql.db.profile.Color.ColorItemTooltip.r,
                                                    beql.db.profile.Color.ColorItemTooltip.g,
                                                    beql.db.profile.Color.ColorItemTooltip.b,
                                                    beql.db.profile.Color.ColorItemTooltip.a
                                end,
                                set =   function(info, r, g, b, a)
                                            beql.db.profile.Color.ColorItemTooltip.r    =   r
                                            beql.db.profile.Color.ColorItemTooltip.g    =   g
                                            beql.db.profile.Color.ColorItemTooltip.b    =   b
                                            beql.db.profile.Color.ColorItemTooltip.a    =   a
                                end,
                                hasAlpha    =   false,
                                disabled    =   function(info) return beql.db.profile.TooltipItemFade end,
                            },
                            Spacer2 =   {
                                            type    =   'header',
                                            order   =   92,
                                            name    =   L["Title color"],
                                    },
                            ColorTitleDiff  =   {
                                type    =   'toggle',
                                order   =   93,
                                name    =   L["Use Quest Level Colors"],
                                desc    =   L["Use Quest Level Colors"],
                                get =   function(info) return beql.db.profile.TooltipTitleDiff end,
                                set =   function(info, newval) beql.db.profile.TooltipTitleDiff =   newval end,
                            },
                            ColorTitle  =   {
                                type    =   'color',
                                order   =   97,
                                name    =   L["Header Color"],
                                desc    =   L["Sets the color for headers"],
                                get =   function(info)
                                            return beql.db.profile.Color.TooltipQuestTitle.r,
                                                    beql.db.profile.Color.TooltipQuestTitle.g,
                                                    beql.db.profile.Color.TooltipQuestTitle.b,
                                                    beql.db.profile.Color.TooltipQuestTitle.a
                                end,
                                set =   function(info, r, g, b, a)
                                            beql.db.profile.Color.TooltipQuestTitle.r   =   r
                                            beql.db.profile.Color.TooltipQuestTitle.g   =   g
                                            beql.db.profile.Color.TooltipQuestTitle.b   =   b
                                            beql.db.profile.Color.TooltipQuestTitle.a   =   a
                                end,
                                hasAlpha    =   false,
                                disabled    =   function(info) return beql.db.profile.TooltipTitleDiff end,
                            },
                        },
                    }
                },
            },
            -- Locale Options - values will be added later
            --[[
            qlocales    =   {
                type    =   'group',
                order   =   5,
                name    =   L["Pick Locale"],
                desc    =   L["Change Locale (needs Interface Reload)"],
                args    =   {
                },
            },
            --]]
            -- Fubar Options
            fubar   =   {
                type    =   'group',
                order   =   6,
                name    =   L["FubarPlugin Config"],
                desc    =   L["FubarPlugin Config"],
                args    =   {
                    headline    =   {
                        type    =   'header',
                        order   =   1,
                        name    =   "currently disabled",
                    },
                },
            },
            --[[
            fubar   =   {
                type    =   'group',
                order   =   6,
                name    =   L["FubarPlugin Config"],
                desc    =   L["FubarPlugin Config"],
                args    =   {
                    headline    =   {
                        type    =   'header',
                        order   =   1,
                        name    =   L["FubarPlugin Config"],
                    },
                    hideplugin= {
                        type    =   'toggle',
                        order   =   2,
                        width   =   'full',
                        name    =   L["Hide plugin"],
                        desc    =   L["Hide the plugin from the panel or minimap, leaving the addon running."],
                        get =   function(info) return beql.db.profile.fubar.HidePlugin end,
                        set =   function(info, newval)
                                            beql.db.profile.fubar.HidePlugin    =   newval;
                                            beqlfu:UpdateFuBarPlugin()
                                    end,
                    },
                    showIcon    =   {
                        type    =   'toggle',
                        order   =   3,
                        width   =   'full',
                        name    =   L["Show icon"],
                        desc    =   L["Show the plugins icon on the panel."],
                        get =   function(info) return beql.db.profile.fubar.ShowIcon end,
                        set =   function(info, newval) beql.db.profile.fubar.ShowIcon = newval end,
                        disabled    =   function(info) return beql.db.profile.HideFuBarPlugin end,
                    },
                    showText    =   {
                        type    =   'toggle',
                        order   =   4,
                        width   =   'full',
                        name    =   L["Show text"],
                        desc    =   L["Show the plugins text on the panel."],
                        get =   function(info) return beql.db.profile.fubar.ShowText end,
                        set =   function(info, newval) beql.db.profile.fubar.ShowText = newval end,
                        disabled    =   function(info) return beql.db.profile.HideFuBarPlugin end,
                    },
                    showcoloredText =   {
                        type    =   'toggle',
                        order   =   5,
                        width   =   'full',
                        name    =   L["Show colored text"],
                        desc    =   L["Allow the plugin to color its text."],
                        get =   function(info) return beql.db.profile.fubar.TextColored end,
                        set =   function(info, newval) beql.db.profile.fubar.TextColored = newval end,
                        disabled    =   function(info) return beql.db.profile.HideFuBarPlugin end,
                    },
                    detachtooltip   =   {
                        type    =   'toggle',
                        order   =   6,
                        width   =   'full',
                        name    =   L["Detach tooltip"],
                        desc    =   L["Detach the tooltip from the panel."],
                        -- get =   function(info) return beqlfu:IsTooltipDetached()  end,
                        set =   function(info, newval) beqlfu:ToggleTooltipDetached() end,
                        disabled    =   function(info) return beql.db.profile.HideFuBarPlugin end,
                    },
                    lockTooltip =   {
                        type    =   'toggle',
                        order   =   7,
                        width   =   'full',
                        name    =   L["Lock tooltip"],
                        desc    =   L["Lock the tooltips position. When the tooltip is locked, you must use Alt to access it with your mouse."],
                        -- get =   function(info) return '' end,
                        set =   function(info, newval) end,
                        disabled    =   function(info) return beql.db.profile.HideFuBarPlugin or true end,
                    },
                    position    =   {
                        type    =   'select',
                        order   =   8,
                        -- width   =   'full',
                        name    =   L["Position"],
                        desc    =   L["Position the plugin on the panel."],
                        values  =   {LEFT   =   L["Left"], CENTER   =   L["Center"], RIGHT  =   L["Right"]},
                        -- get =   function(info) return beqlfu:GetDefaultPosition()  end,
                        set =   function(info, newval)
                                                beqlfu.defaultPosition  =   newval
                                                beqlfu:Hide()
                                                beqlfu:Show()
                                                beqlfu:ToggleMinimapAttached(newval)
                                    end,
                        -- disabled    =   function(info) return beql.db.profile.HideFuBarPlugin or beqlfu:IsMinimapAttached() end,
                    },
                    attachMinimap   =   {
                        type    =   'toggle',
                        order   =   9,
                        width   =   'full',
                        name    =   L["Attach to minimap"],
                        desc    =   L["Attach the plugin to the minimap instead of the panel."],
                        -- get =   function(info) return beqlfu:IsMinimapAttached() end,
                        set =   function(info, newval) beqlfu:ToggleMinimapAttached(newval) end,
                        disabled    =   function(info) return beql.db.profile.HideFuBarPlugin or not IsAddOnLoaded("FuBar") end,
                    },
                    MinimapPosition =   {
                        type    =   'range',
                        order   =   10,
                        width   =   'full',
                        min =   1,
                        max =   360,
                        step    =   1,
                        name    =   L["Minimap position"],
                        desc    =   L["Minimap position"],
                        -- get =   function(info) return beqlfu.db.profile.minimapPosition end,
                        set =   function(info, newval)
                        beqlfu.db.profile.minimapPosition   =   newval
                        beqlfu:Hide()
                        beqlfu:Show()
                        end,
                        -- disabled    =   function(info) return beql.db.profile.HideFuBarPlugin or not beqlfu:IsMinimapAttached() end,
                    },
                },
            },
            --]]
            -- Profiles
            profiles    =   LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db),
            --[[
            profiles    =   {
                type    =   'group',
                order   =   5,
                name    =   "",
                desc    =   "",
                args    =   {
                    desc    =   {
                        order   =   1,
                        type    =   "description",
                        name    =   L["ace2profile_intro"] .. "\n",
                    },
                    -- [ [
                    currProfile =   {
                        type    =   'description',
                        order   =   99,
                        name    =   function(info) return "PH_Your current profile is " .. beql:GetProfile() .. "." end,
                    },
                    -- ] ]
                    choosedesc  =   {
                            type    =   'description',
                            order   =   2,
                            name    =   L["ace2profile_choose_desc"],
                    },
                    new =   {
                        type    =   "input",
                        order   =   3,
                        name    =   L["ace2profile_new"],
                        desc    =   L["ace2profile_new_sub"],
                        get =   false,
                        set =   function(info, newval) beql:SetProfile(newval) end,
                        usage   =   "<profile name>",
                    },
                    choose  =   {
                        type    =   "select",
                        order   =   4,
                        name    =   L["ace2profile_choose"],
                        desc    =   L["ace2profile_choose_sub"],
                        values  =   function() return beql['acedb-profile-list'] end,
                        get =   function(info) return beql:GetProfile() end,
                        set =   function(info, newval) beql:SetProfile(newval) end,
                    },
                    copydesc    =   {
                            type    =   'description',
                            order   =   5,
                            name    =   "\n" .. L["ace2profile_copy_desc"],
                    },
                    copy    =   {
                        type    =   "select",
                        order   =   5,
                        name    =   L["ace2profile_copy"],
                        desc    =   L["ace2profile_copy_desc"],
                        values  =   function() return beql['acedb-profile-copylist'] end,
                        get =   false,
                        set =   function(info, val)
                                    beql:CopyProfileFrom(val)
                                end,
                        disabled    =   function()
                                        if beql['acedb-profile-copylist'] then
                                            return not next(beql['acedb-profile-copylist'])
                                        else
                                            return false
                                        end
                                        end
                        --disabled  =   nil --  skipped inline function ,
                    },
                    deldesc =   {
                            type    =   'description',
                            order   =   6,
                            name    =   "\n" .. L["ace2profile_delete_desc"],
                    },
                    delete  =   {
                        type    =   "select",
                        order   =   7,
                        name    =   L["ace2profile_delete"],
                        desc    =   L["ace2profile_delete_sub"],
                        values  =   function()
                                        local tmptable  =   {}
                                        -- filter nondeletable Profiles
                                        for k, v in pairs (beql['acedb-profile-list']) do
                                            if not (k == "char" or k == "class" or k == "realm" or k == "Default") then
                                                tmptable[k] =   v
                                            end
                                        end
                                        return tmptable end,
                        get =   false,
                        set =   function(info, newval)
                                    local s, _  =   beql:GetProfile()
                                    if newval ~= s then
                                        beql:DeleteProfile(newval)
                                    else
                                        message("PH_Cannot delete a profile while it is in use")
                                    end
                                end,
                        disabled    =   function()
                                        local tmpint    =   0
                                        -- filter nondeletable Profiles
                                        for k, v in pairs (beql['acedb-profile-list']) do
                                            if not (k == "char" or k == "class" or k == "realm" or k == "Default") then
                                                tmpint  =   tmpint + 1
                                            end
                                        end
                                        if tmpint == 0 then return true end
                                        end,
                    },
                    resetdesc   =   {
                            type    =   'description',
                            order   =   10,
                            name    =   "\n" .. L["ace2profile_reset_desc"],
                    },
                    reset = {
                        type = "execute",
                        order   =   11,
                        name = L["ace2profile_reset"],
                        desc    =   L["ace2profile_reset_sub"],
                        func    =   function() beql:ResetDB('profile') end,
                        confirm =   true,
                    },
                },
            },
            --]]
            -- Achievements
            achievement =   {
                type    =   'group',
                order   =   3,
                name    =   L["Disable Tracker"],
                desc    =   L["Disable the Tracker"].." - "..L["Requires Interface Reload"],
                args    =   {
                    LockedTracker   =   {
                        type    =   'toggle',
                        order   =   1,
                        name    =   L["Lock Tracker"],
                        desc    =   L["Makes the achievement tracker unmovable"],
                        get =   function(info) return beql.db.profile.atracker.Locked end,
                        set =   function(info, newval) beql:moveableATracker(newval) end,
                        disabled    =   function(info) return not beql.db.profile.atracker.Enable end,
                    },
                    ResetTracker    =   {
                        type    =   'execute',
                        order   =   2,
                        name    =   L["Reset tracker position"],
                        desc    =   L["Reset tracker position"],
                        func    =   function(info)
                                        beql.ATrackerAnchor:ClearAllPoints()
                                        beql.ATrackerAnchor:SetPoint("TOPRIGHT", "MinimapCluster", "BOTTOMRIGHT", -93, -13)
                                        beql:SavePositionATracker()
                                        beql:ATracker_Update()
                                    end,
                        disabled    =   function(info) return not beql.db.profile.atracker.Enable end,
                    },
                    Spacing1    =   {
                        type    =   'header',
                        order   =   3,
                        name    =   '',
                    },
                    ShowATrackerHeader  =   {
                        type    =   'toggle',
                        order   =   4,
                        width   =   'full',
                        name    =   L["Show Achievement Tracker Header"],
                        desc    =   L["Shows the header of the Achievementtracker"],
                        get =   function(info) return beql.db.profile.atracker.headline end,
                        set =   function(info, newval)
                                    beql.db.profile.atracker.headline   =   newval
                                    if newval then
                                        beql:maximizeATracker()
                                        beql.db.char.AchievementTracker.minimized   =   false
                                    end
                                    beql:ATracker_Update()
                                end,
                        disabled    =   function(info) return not beql.db.profile.atracker.Enable end,
                    },
                    savelast    =   {
                        type    =   'toggle',
                        order   =   5,
                        width   =   'full',
                        name    =   L["Save tracked Achievement"],
                        desc    =   L["Save last tracked Achievement and resore it after login"],
                        get =   function(info) return beql.db.profile.atracker.savelast end,
                        set =   function(info, newval)
                                        beql.db.profile.atracker.savelast   =   newval
                                    end,
                        disabled    =   function(info) return not beql.db.profile.atracker.Enable end,
                    },
                    RemoveFinished  =   {
                        type    =   'toggle',
                        order   =   6,
                        width   =   'full',
                        name    =   L["Remove Completed Achievement"],
                        desc    =   L["Automatical remove the completed Achievement from tracker"],
                        get =   function(info) return beql.db.profile.atracker.RemoveFinished end,
                        set =   function(info, newval)
                                    beql.db.profile.atracker.RemoveFinished =   newval
                                    if newval then
                                        beql:RegisterEvent("ACHIEVEMENT_EARNED");
                                    else
                                        beql:UnregisterEvent("ACHIEVEMENT_EARNED");
                                    end
                                end,
                        disabled    =   function(info) return not beql.db.profile.atracker.Enable end,
                    },
                    Spacing2    =   {
                        type    =   'header',
                        order   =   7,
                        name    =   '',
                    },
                    ATrackerAlpha   =   {
                        type    =   'range',
                        order   =   8,
                        width   =   'full',
                        name    =   L["Achievement Tracker Alpha"],
                        desc    =   L["Sets the Alpha of the Achievement Tracker"],
                        get =   function(info) return beql.db.profile.atracker.alpha end,
                        set =   function(info, newval)
                                    beql.db.profile.atracker.alpha  =   newval
                                    beql:ATracker_Update()
                                end,
                        min =   0,
                        max =   1,
                        step    =   0.01,
                        disabled    =   function(info) return not beql.db.profile.atracker.Enable end,
                    },
                    ATrackerScale   =   {
                        type    =   'range',
                        order   =   9,
                        width   =   'full',
                        name    =   L["Achievement Tracker Scale"],
                        desc    =   L["Sets the Scale of the Achievement Tracker"],
                        get =   function(info) return beql.db.profile.atracker.scale end,
                        set =   function(info, newval)
                                    beql.db.profile.atracker.scale  =   newval
                                    beql:ATracker_Update()
                                end,
                        min =   0.5,
                        max =   1.5,
                        step    =   0.05,
                        disabled    =   function(info) return not beql.db.profile.atracker.Enable end,
                    },
                    Spacing6    =   {
                        type    =   'header',
                        order   =   10,
                        name    =   L["Colors"],
                    },
                    -- Colors on Achievementtracker
                    Colors  =   {
                        type    =   'group',
                        guiInline   =   true,
                        name    =   '',
                        desc    =   L["Set tracker Colors"],
                        order   =   11,
                        args    =   {
                            Background  =   {
                                type    =   'toggle',
                                order   =   1,
                                width   =   'full',
                                name    =   L["Background"],
                                desc    =   L["Use Background"],
                                get =   function(info) return beql.db.profile.atracker.showbg end,
                                set =   function(info, newval)
                                            beql.db.profile.atracker.showbg =   newval
                                            beql:ATracker_Update()
                                        end,
                                disabled    =   function(info) return not beql.db.profile.atracker.Enable end,
                            },
                            CustomBackground    =   {
                                type    =   'toggle',
                                order   =   2,
                                width   =   'full',
                                name    =   L["Custom Background Color"],
                                desc    =   L["Use custom color for background"],
                                get =   function(info) return beql.db.profile.atracker.ownbgcolor end,
                                set =   function(info, newval)
                                            beql.db.profile.atracker.ownbgcolor =   newval
                                            beql:ATracker_Update()
                                        end,
                                disabled    =   function(info) return not beql.db.profile.atracker.showbg  or not beql.db.profile.atracker.Enable end,
                            },
                            BackgroundColor =   {
                                type    =   'color',
                                order   =   3,
                                name    =   L["Background Color"],
                                desc    =   L["Sets the Background Color"],
                                get =   function(info)
                                            local a =   beql.db.profile.atracker.BgColor.a
                                            local b =   beql.db.profile.atracker.BgColor.b
                                            local g =   beql.db.profile.atracker.BgColor.g
                                            local r =   beql.db.profile.atracker.BgColor.r

                                            --return , , ,
                                            return r, g, b, a
                                end,
                                set =   function(info, r, g, b, a)
                                                beql.db.profile.atracker.BgColor    =   {
                                                                r   =   r,
                                                                g   =   g,
                                                                b   =   b,
                                                                a   =   a,
                                                },
                                                beql:ATracker_Update()
                                end,
                                hasAlpha    =   true,
                                disabled    =   function(info) return not beql.db.profile.atracker.ownbgcolor  or not beql.db.profile.atracker.Enable end,
                            },
                            BackgroundCornerColor   =   {
                                type    =   'color',
                                order   =   4,
                                name    =   L["Background Corner Color"],
                                desc    =   L["Sets the Background Corner Color"],
                                get =   function(info)
                                            local a =   beql.db.profile.atracker.BgCornerColor.a
                                            local b =   beql.db.profile.atracker.BgCornerColor.b
                                            local g =   beql.db.profile.atracker.BgCornerColor.g
                                            local r =   beql.db.profile.atracker.BgCornerColor.r

                                            --return , , ,
                                            return r, g, b, a
                                end,
                                set =   function(info, r, g, b, a)
                                                beql.db.profile.atracker.BgCornerColor  =   {
                                                                r   =   r,
                                                                g   =   g,
                                                                b   =   b,
                                                                a   =   a,
                                                },
                                                beql:ATracker_Update()
                                end,
                                hasAlpha    =   true,
                                disabled    =   function(info) return not beql.db.profile.atracker.ownbgcolor  or not beql.db.profile.atracker.Enable end,
                            },
                        },
                    },
                },
            },
        },
    }
    beql.options = MainOptionsTable;

    -- add Sounds to Options
    local i =   1
    for k, v in pairs (beql.sounds) do
        i   =   i +1
        MainOptionsTable.args.qlog.args.QuestCompletionSound.args[k]    =   {
            type    =   'toggle',
            name    =   k,
            desc    =   k,
            get =   function(info)
                        if beql.db.profile.InfoSound == v then
                                return true
                        else
                                return false
                        end
                        end,
            set =   function(onfo, newval)
                        if newval then
                                beql.db.profile.InfoSound   =   v
                        end
                        PlaySoundFile(v)
                        end,
        }
    end

    -- add locale to loacels options
    --[[
    local values    =   {}
    for k in L:IterateAvailableLocales() do
        values[k]   =   _G[string.upper(k)] or k
        MainOptionsTable.args.qlocales.args["locale"..k]    =   {
            type    =   'toggle',
            name    =   k,
            desc    =   L["Requires Interface Reload"],
            get =   function(info)
                if L:GetLocale() == k then
                    return true
                else
                    return false
                end
            end,
            set =   function(info) beql:Nyelv(k) end,
        }
    end
    --]]

        for k,v in pairs(modularOptions) do
            MainOptionsTable.args[k]    =   (type(v) == "function") and v() or v
        end
end

function beql:SetMovableQuestlog(newValue)
    self.db.profile.locked = newValue
    if self.db.profile.locked then
        QuestLogFrame:RegisterForDrag(0)
    else
        QuestLogFrame:RegisterForDrag("LeftButton")
    end
end

function beql:SetMovableQuestTracker(newValue)
    self.db.profile.lockedtracker = newValue
    if not self.db.profile.disabled.tracker and not self.db.profile.disabledtracker then
        if self.db.profile.lockedtracker then
            QuestWatchFrame:RegisterForDrag(0)
            -- beql.TrackerTitleBar:RegisterForDrag(0)
        else
            QuestWatchFrame:RegisterForDrag("LeftButton")
            -- beql.TrackerTitleBar:RegisterForDrag("LeftButton")
        end
    end
    beql:CheckMouseEvents()
end

function beql:SetMovableAchievementTracker(newValue)
    self.db.profile.lockedtracker = newValue
    if not self.db.profile.disabled.tracker and not self.db.profile.disabledtracker then
        if self.db.profile.lockedtracker then
            AchievementWatchFrame:RegisterForDrag(0)
            -- beql.TrackerTitleBar:RegisterForDrag(0)
        else
            AchievementWatchFrame:RegisterForDrag("LeftButton")
            -- beql.TrackerTitleBar:RegisterForDrag("LeftButton")
        end
    end
    beql:CheckMouseEvents()
end

function beql:CheckMouseEvents()
    if beql.db.profile.disabledtracker then
        return
    else
        if not beql.db.profile.activetracker and not beql.db.profile.activetrackerleft and not beql.db.profile.activetrackerright and beql.db.profile.lockedtracker then
            WatchFrame:EnableMouse(false)
            -- beql.TrackerTitleBar:EnableMouse(false)
        else
            WatchFrame:EnableMouse(true)
            -- beql.TrackerTitleBar:EnableMouse(true)
        end
    end
end

function beql:setinfoonquestcomplete(newValue)
    self.db.profile.InfoOnQuestCompletion = newValue
end

-- Tracker List and Symbols
BEQL_TrackerLists = {}
BEQL_TrackerLists[0] = {}
BEQL_TrackerLists[0][0] = "1"
BEQL_TrackerLists[0][1] = "2"
BEQL_TrackerLists[0][2] = "3"
BEQL_TrackerLists[0][3] = "4"
BEQL_TrackerLists[0][4] = "5"
BEQL_TrackerLists[0][5] = "6"
BEQL_TrackerLists[0][6] = "7"
BEQL_TrackerLists[0][7] = "8"
BEQL_TrackerLists[0][8] = "9"
BEQL_TrackerLists[0][9] = "10"

BEQL_TrackerLists[1] = {}
BEQL_TrackerLists[1][0] = "a"
BEQL_TrackerLists[1][1] = "b"
BEQL_TrackerLists[1][2] = "c"
BEQL_TrackerLists[1][3] = "d"
BEQL_TrackerLists[1][4] = "e"
BEQL_TrackerLists[1][5] = "f"
BEQL_TrackerLists[1][6] = "g"
BEQL_TrackerLists[1][7] = "h"
BEQL_TrackerLists[1][8] = "i"
BEQL_TrackerLists[1][9] = "j"

BEQL_TrackerLists[2] = {}
BEQL_TrackerLists[2][0] = "A"
BEQL_TrackerLists[2][1] = "B"
BEQL_TrackerLists[2][2] = "C"
BEQL_TrackerLists[2][3] = "D"
BEQL_TrackerLists[2][4] = "E"
BEQL_TrackerLists[2][5] = "F"
BEQL_TrackerLists[2][6] = "G"
BEQL_TrackerLists[2][7] = "H"
BEQL_TrackerLists[2][8] = "I"
BEQL_TrackerLists[2][9] = "J"

BEQL_TrackerLists[3] = {}
BEQL_TrackerLists[3][0] = "I"
BEQL_TrackerLists[3][1] = "II"
BEQL_TrackerLists[3][2] = "III"
BEQL_TrackerLists[3][3] = "IV"
BEQL_TrackerLists[3][4] = "V"
BEQL_TrackerLists[3][5] = "VI"
BEQL_TrackerLists[3][6] = "VII"
BEQL_TrackerLists[3][7] = "VIII"
BEQL_TrackerLists[3][8] = "IX"
BEQL_TrackerLists[3][9] = "X"

BEQL_TrackerSymbols = {}
BEQL_TrackerSymbols[0] = "-"
BEQL_TrackerSymbols[1] = "+"
BEQL_TrackerSymbols[2] = "@"
BEQL_TrackerSymbols[3] = ">"

-- Sounds
beql.sounds = {}
beql.sounds["Exploration"] = "Sound\\Interface\\GnomeExploration.wav"
beql.sounds["HordeVictory"] = "Sound\\Interface\\PVPVictoryHordeMono.wav"
beql.sounds["AllianceVictory"] = "Sound\\Interface\\PVPVictoryAllianceMono.wav"
beql.sounds["FlagCaptured1"] = "Sound\\Interface\\PVPFlagCapturedmono.wav"
beql.sounds["FlagCaptured2"] = "Sound\\Interface\\PVPFlagCapturedHordemono.wav"
beql.sounds["RaidWarning"] = "Sound\\Interface\\RaidWarning.wav"
beql.sounds["ReadyCheck"] = "Sound\\Interface\\ReadyCheck.wav"
beql.sounds["LevelUp1"] = "Sound\\Interface\\LevelUp.wav"
beql.sounds["LevelUp2"] = "Sound\\Interface\\levelup2.wav"
beql.sounds["Message"] = "Sound\\Interface\\iTellMessage.wav"
beql.sounds["Cow"] = "Sound\\Creature\\Cow\\CowDeath.wav"
beql.sounds["WorkComplete"] = "Sound\\Creature\\Peon\\PeonBuildingComplete1.wav"

--- EOF ---