-- $Id: FastQuestOptions.lua 79 2009-05-21 18:19:42Z arithmandar $
--[[
    FastQuestOptions.lua
]]

function FastQuest_Options_OnLoad(self)
    FQ_Debug_Print("FastQuest_Options_OnLoad()");

    UIPanelWindows['FastQuestOptionsFrame'] = { area = 'center', pushable = 0 };
end

function FastQuest_Options_Init()
    FQ_Debug_Print("FastQuest_Options_Init()");

    FQOptionsAutoNotify:SetChecked(FQD.AutoNotify);
    FQOptionsNotifyNearby:SetChecked(FQD.NotifyNearby);
    FQOptionsNotifyParty:SetChecked(FQD.NotifyParty);
    FQOptionsNotifyRaid:SetChecked(FQD.NotifyRaid);
    FQOptionsNotifyGuild:SetChecked(FQD.NotifyGuild);

    FQOptionsNotifyDetail:SetChecked(FQD.Detail);
    FQOptionsNotifyExpGain:SetChecked(FQD.NotifyExp);
    FQOptionsNotifyDiscover:SetChecked(FQD.NotifyDiscover);
    FQOptionsNotifyLevelUp:SetChecked(FQD.NotifyLevelUp);

    FQOptionsEnableColor:SetChecked(FQD.Color);
    FQOptionsMemberInfo:SetChecked(FQD.MemberInfo);

    --	FQOptionsNoDrag:SetChecked(FQD.NoDrag);
    FQOptionsLock:SetChecked(FQD.Lock);
    FQOptionsAutoAdd:SetChecked(FQD.AutoAdd);
    FQOptionsAutoComplete:SetChecked(FQD.AutoComplete);
    FQOptionsShowTag:SetChecked(FQD.Tag);
    FQOptionsShowMiniMap:SetChecked(FQD.ShowButton);
    FQOptionsDoubleWidth:SetChecked(FQD.DoubleWidth);

    FQOptionsQuestFormat:SetValue(FQD.Format);
    FQOptionsSliderButtonPos:SetValue(FQD.ButtonPos);
end

function FastQuest_Options_Save()
    FQ_Debug_Print("FastQuest_Options_Save()");

    FQD.Format = FQOptionsQuestFormat:GetValue();
end

function FastQuest_Options_Toggle()
    FQ_Debug_Print("FastQuest_Options_Toggle()");

    if (FastQuestOptionsFrame:IsVisible()) then
        FastQuestOptionsFrame:Hide();
    else
        FastQuestOptionsFrame:Show();
    end
    if InterfaceOptionsFrame:IsVisible() then
        InterfaceOptionsFrame:Hide();
    else
        InterfaceOptionsFrame_OpenToCategory("FastQuest_Classic");
    end
end

function FastQuestOptions_ResetPosition()
    FQ_Debug_Print("FastQuestOptions_ResetPosition()");

    FastQuestFrame:SetPoint("TOPLEFT", 0, -104);
end

function FastQuest_ToggleBoolean(bool, msg)
    if (bool == false) then
        qOut(msg .. FQ_ENABLED);
        bool = true;
    else
        qOut(msg .. FQ_DISABLED);
        bool = false;
    end
    return bool;
end

function FastQuest_ShowBoolean(bool)
    if (bool == true) then
        return FQ_ENABLED;
    else
        return FQ_DISABLED;
    end
end

function FastQuest_Toggle_NotifyParty()
    info = FQ_INFO .. FQ_INFO_NOTIFYPARTY;
    FQD.NotifyParty = FastQuest_ToggleBoolean(FQD.NotifyParty, info);
    FastQuest_Options_Init();
end

function FastQuest_Toggle_NotifyGuild()
    info = FQ_INFO .. FQ_INFO_NOTIFYGUILD;
    FQD.NotifyGuild = FastQuest_ToggleBoolean(FQD.NotifyGuild, info);
    FastQuest_Options_Init();
end

function FastQuest_Toggle_NotifyRaid()
    info = FQ_INFO .. FQ_INFO_NOTIFYRAID;
    FQD.NotifyRaid = FastQuest_ToggleBoolean(FQD.NotifyRaid, info);
    FastQuest_Options_Init();
end

function FastQuest_Toggle_NotifyNearby()
    info = FQ_INFO .. FQ_INFO_NOTIFYNEARBY;
    FQD.NotifyNearby = FastQuest_ToggleBoolean(FQD.NotifyNearby, info);
    FastQuest_Options_Init();
end

function FastQuest_Toggle_AutoAdd()
    info = FQ_INFO .. FQ_INFO_AUTOADD;
    FQD.AutoAdd = FastQuest_ToggleBoolean(FQD.AutoAdd, info);
    FastQuest_Options_Init();
end

function FastQuest_Toggle_AutoComplete()
    info = FQ_INFO .. FQ_INFO_AUTOCOMPLETE;
    FQD.AutoComplete = FastQuest_ToggleBoolean(FQD.AutoComplete, info);
    FastQuest_Options_Init();
end

function FastQuest_Toggle_AutoNotify()
    info = FQ_INFO .. FQ_INFO_AUTONOTIFY;
    FQD.AutoNotify = FastQuest_ToggleBoolean(FQD.AutoNotify, info);
    FastQuest_Options_Init();
end

function FastQuest_Toggle_Clear()
    for i = GetNumQuestWatches(), 1, -1 do
        local qID = GetQuestIndexForWatch(i)
        FQD[FQ_server][FQ_player].tQuests[i] = " ";
        RemoveQuestWatch(qID);
    end
    FQD[FQ_server][FQ_player].nQuests = 0;
    WatchFrame_Update();
    qOut(FQ_INFO .. FQ_INFO_CLEAR);
end

function FastQuest_Toggle_Color()
    info = FQ_INFO .. FQ_INFO_COLOR;
    FQD.Color = FastQuest_ToggleBoolean(FQD.Color, info);
    QuestLog_Update();
    WatchFrame_Update();
    FastQuest_Options_Init();
end

function FastQuest_Toggle_NotifyDetails()
    info = FQ_INFO .. FQ_INFO_DETAIL;
    FQD.Detail = FastQuest_ToggleBoolean(FQD.Detail, info);
    FastQuest_Options_Init();
end

function FastQuest_Toggle_Lock()
    qOut(FQ_INFO .. FQ_INFO_LOCK);
    FQD.Lock = true;
    FastQuest_LockMovableParts();
    FastQuest_Options_Init();
end

function FastQuest_Toggle_Unlock()
    qOut(FQ_INFO .. FQ_INFO_UNLOCK);
    FQD.Lock = false;
    FastQuest_LockMovableParts();
    FastQuest_Options_Init();
end

function FastQuest_Toggle_Nodrag()
    info = FQ_INFO .. FQ_INFO_NODRAG;
    FQD.NoDrag = FastQuest_ToggleBoolean(FQD.NoDrag, info);
    if (FQD.NoDrag == false) then FQD.Lock = true; end
    qOut(FQ_MUST_RELOAD);
    FastQuest_Options_Init();
end

function FastQuest_Toggle_Reset()
    FastQuestFrame:SetPoint("TOPLEFT", "Minimap", "TOPLEFT", -20, -15);
    dQuestWatchDragButton:SetPoint("TOPLEFT", "UIParent", "TOPRIGHT", -250, -250);
    qOut(FQ_INFO .. FQ_INFO_RESET);
end

function FastQuest_Toggle_Format()
    if (FQD.Format == nil) then FQD.Format = 1; end
    if (FQD.Format == (FQ_nFormats)) then
        FQD.Format = 1;
    else
        FQD.Format = FQD.Format + 1;
    end
    qOut(FQ_INFO_DISPLAY_AS .. FQ_Formats[FQD.Format]);
    FastQuest_Options_Init();
end

function FastQuest_Toggle_MemberInfo()
    info = FQ_INFO .. FQ_INFO_MEMBERINFO;
    FQD.MemberInfo = FastQuest_ToggleBoolean(FQD.MemberInfo, info);
    QuestLog_Update();
    FastQuest_Options_Init();
end

function FastQuest_Toggle_NotifyExp()
    info = FQ_INFO .. FQ_INFO_NOTIFYEXP;
    FQD.NotifyExp = FastQuest_ToggleBoolean(FQD.NotifyExp, info);
    FastQuest_Options_Init();
end

function FastQuest_Toggle_NotifyLevelUp()
    info = FQ_INFO .. FQ_INFO_NOTIFYLEVELUP;
    FQD.NotifyLevelUp = FastQuest_ToggleBoolean(FQD.NotifyLevelUp, info);
    FastQuest_Options_Init();
end

function FastQuest_Toggle_NotifyDiscover()
    info = FQ_INFO .. FQ_INFO_NOTIFYDISCOVER;
    FQD.NotifyDiscover = FastQuest_ToggleBoolean(FQD.NotifyDiscover, info);
    FastQuest_Options_Init();
end

function FastQuest_Toggle_ShowMiniMap()
    info = FQ_INFO .. FQ_INFO_SHOWMINIMAP;
    FQD.ShowButton = FastQuest_ToggleBoolean(FQD.ShowButton, info);
    FastQuest_Options_Init();
    if (FQD.ShowButton) then
        FastQuest_Classic_ButtonFrame:Show();
    else
        FastQuest_Classic_ButtonFrame:Hide();
    end
end

function FastQuest_Toggle_DoubleWidth()
    info = FQ_INFO .. FQ_INFO_DOUBLEWIDTH;
    FQD.DoubleWidth = FastQuest_ToggleBoolean(FQD.DoubleWidth, info);
    FastQuest_Options_Init();
    if (FQD.DoubleWidth) then
        FQ_QuestLogFrame_DoubleWidth();
    else
        qOut(FQ_MUST_RELOAD);
    end
end

function FastQuest_Toggle_UpdatePosition()
    FastQuest_Classic_ButtonFrame:SetPoint("TOPLEFT",
        "Minimap",
        "TOPLEFT",
        55 - (75 * cos(FQD.ButtonPos)),
        (75 * sin(FQD.ButtonPos)) - 55);
end

function FastQuest_Toggle_Tag()
    info = FQ_INFO .. FQ_INFO_QUEST_TAG;
    FQD.Tag = FastQuest_ToggleBoolean(FQD.Tag, info);
    QuestLog_Update();
    WatchFrame_Update();
    FastQuest_Options_Init();
end
