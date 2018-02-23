function EUF_OptionFrame_OnShow()
    for index,value in pairs(EUF_CurrentOptions) do
        local unitOption = getglobal("EUF_OptionFrame" .. index);

        if (unitOption) then
            getglobal("EUF_OptionFrame" .. index .. "Text"):SetText(getglobal("EUF_TEXT_OPTION_" .. index));

            if unitOption.SetChecked then
                unitOption:SetChecked(value);
            end;

            if unitOption.SetValue then
                unitOption:SetValue(value);
            end;
        end;
    end;
end

function EUF_OptionCheckButton_OnClick(arg1, button)
    local optionId;
    _, _, optionId = string.find(arg1, "EUF_OptionFrame(.+)");
    
    local value = getglobal(arg1):GetChecked();

    if value then
        value = 1;
    else
        value = 0;
    end;

    EUF_Options_Update(optionId, value);
end

function EUF_OptionSlider_OnChange(arg1, value)
    local optionId;
    _, _, optionId = string.find(arg1, "EUF_OptionFrame(.+)");

    EUF_Options_Update(optionId, value)
end

function EUF_OptionButton_OnClick(arg1)
    local optionId;
    _, _, optionId = string.find(arg1, "EUF_OptionFrame(.+)");

    if (optionId == "CONFIRM") then
        EUF_OptionFrame:Hide();
    elseif (optionId == "DEFAULT") then
        EUF_OptionsDefault_Load();

        if EUF_Frame_Update then
            EUF_Frame_Update();
            EUF_PlayerFrameFrm_Update();
            EUF_PlayerFrameExtBar_Update();
        end;
    elseif (optionId == "DEFAULTPOSITION") then
        EUF_HpMpXp_Reset();
    end;
end

function EUF_UIPanel_OnLoad(panel)
    testmode = 0;

    EUF_UI = {};
    EUF_UI.panel = _G["EUF_OptionFrame"];
    EUF_UI.panel.name = "EN_UnitFrames";
    InterfaceOptions_AddCategory(EUF_UI.panel);
    
    EUF_UI.childpanel1 = _G["EUF_OptionFramePlayerPanel"];
    EUF_UI.childpanel1.name = EUF_TEXT_OPTION_PLAYER;
    EUF_UI.childpanel1.parent = EUF_UI.panel.name;
    InterfaceOptions_AddCategory(EUF_UI.childpanel1);

    EUF_UI.childpanel2 = _G["EUF_OptionFrameTargetPanel"];
    EUF_UI.childpanel2.name = EUF_TEXT_OPTION_TARGET;
    EUF_UI.childpanel2.parent = EUF_UI.panel.name;
    InterfaceOptions_AddCategory(EUF_UI.childpanel2);
    
    EUF_UI.childpanel3 = _G["EUF_OptionFramePartyPanel"];
    EUF_UI.childpanel3.name = EUF_TEXT_OPTION_PARTY;
    EUF_UI.childpanel3.parent = EUF_UI.panel.name;
    InterfaceOptions_AddCategory(EUF_UI.childpanel3);
    
    EUF_UI.childpanel4 = _G["EUF_OptionFrameTargetTargetPanel"];
    EUF_UI.childpanel4.name = EUF_TEXT_OPTION_TARGETTARGET;
    EUF_UI.childpanel4.parent = EUF_UI.panel.name;
    InterfaceOptions_AddCategory(EUF_UI.childpanel4);
    
    EUF_UI.childpanel5 = _G["EUF_OptionFrameFocusPanel"];
    EUF_UI.childpanel5.name = EUF_TEXT_OPTION_FOCUS;
    EUF_UI.childpanel5.parent = EUF_UI.panel.name;
    InterfaceOptions_AddCategory(EUF_UI.childpanel5);
end
