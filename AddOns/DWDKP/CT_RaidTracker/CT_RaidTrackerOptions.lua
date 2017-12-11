function CT_RaidTracker_OptionsFrame_OnShow()
    CT_RaidTrackerOptionsFrameMinQualitySlider:SetValue(CT_RaidTracker_Options["MinQuality"]);
    CT_RaidTrackerOptionsFrameAskCostSlider:SetValue(CT_RaidTracker_Options["AskCost"]);
    CT_RaidTrackerOptionsFrameGetDKPValueSlider:SetValue(CT_RaidTracker_Options["GetDkpValue"]);    
    CT_RaidTrackerOptionsFrameGroupItemsSlider:SetValue(CT_RaidTracker_Options["GroupItems"]);
    CT_RaidTrackerOptionsFrameSaveTooltipsCB:SetChecked(CT_RaidTracker_Options["SaveTooltips"]);
    CT_RaidTrackerOptionsFrameLogAttendeesSlider:SetValue(CT_RaidTracker_Options["LogAttendees"]);
    CT_RaidTrackerOptionsFrameMaxLevelSlider:SetValue(CT_RaidTracker_Options["MaxLevel"]);
    CT_RaidTrackerOptionsFrameExportFormatSlider:SetValue(CT_RaidTracker_Options["ExportFormat"]);
    CT_RaidTrackerOptionsFrameAutoWhisperCB:SetChecked(CT_RaidTracker_Options["AutoWhisper"]);
    CT_RaidTrackerOptionsFrameFilterWhisperCB:SetChecked(CT_RaidTracker_Options["FilterWhisper"]);
    CT_RaidTrackerOptionsFrameExportFormatSlider:Disable();
end

function CT_RaidTracker_OptionsFrame_Save()
    CT_RaidTracker_Options["MinQuality"] = CT_RaidTrackerOptionsFrameMinQualitySlider:GetValue();
    CT_RaidTracker_Options["AskCost"] = CT_RaidTrackerOptionsFrameAskCostSlider:GetValue();
    CT_RaidTracker_Options["GetDkpValue"] = CT_RaidTrackerOptionsFrameGetDKPValueSlider:GetValue();    

    CT_RaidTracker_Options["GroupItems"] = CT_RaidTrackerOptionsFrameGroupItemsSlider:GetValue();
   
    if(CT_RaidTrackerOptionsFrameSaveTooltipsCB:GetChecked() == 1) then
        CT_RaidTracker_Options["SaveTooltips"] = 1;
    else
        CT_RaidTracker_Options["SaveTooltips"] = 0;
    end
    CT_RaidTracker_Options["LogAttendees"] = CT_RaidTrackerOptionsFrameLogAttendeesSlider:GetValue();

    CT_RaidTracker_GetGameTimeOffset();
    CT_RaidTracker_Options["MaxLevel"] = CT_RaidTrackerOptionsFrameMaxLevelSlider:GetValue();
    CT_RaidTracker_Options["ExportFormat"] = CT_RaidTrackerOptionsFrameExportFormatSlider:GetValue();
     if(CT_RaidTrackerOptionsFrameAutoWhisperCB:GetChecked() == 1) then
        CT_RaidTracker_Options["AutoWhisper"] = 1;
    else
        CT_RaidTracker_Options["AutoWhisper"] = 0;
    end
     if(CT_RaidTrackerOptionsFrameFilterWhisperCB:GetChecked() == 1) then
        CT_RaidTracker_Options["FilterWhisper"] = 1;
    else
        CT_RaidTracker_Options["FilterWhisper"] = 0;
    end
end
