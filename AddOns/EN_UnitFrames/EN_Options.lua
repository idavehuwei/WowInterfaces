function EUF_OptionFrame_OnShow()
    for index, value in pairs(EUF_CurrentOptions) do
        local unitOption = getglobal("EUF_OptionFrame" .. index);
        if (unitOption) then
            getglobal("EUF_OptionFrame" .. index .. "Text"):SetText(getglobal("EUF_TEXT_OPTION_" .. index));
            if unitOption.SetChecked then
                unitOption:SetChecked(value);
            end;
            if unitOption.SetValue then
                unitOption:SetValue(value);
            end;
        end
    end
end

function EUF_OptionCheckButton_OnClick(arg1)
    local optionId;
    _, _, optionId = string.find(arg1, "EUF_OptionFrame(.+)");

    local value = getglobal(arg1):GetChecked();
    if value then
        value = 1;
    else
        value = 0;
    end;
    EUF_Options_Update(optionId, value)
end

function EUF_OptionSlider_OnChange(arg1, value)
    local optionId;
    _, _, optionId = string.find(arg1, "EUF_OptionFrame(.+)");
    EUF_Options_Update(optionId, value)
end

;


function EUF_OptionButton_OnClick(arg1)
    local optionId;
    _, _, optionId = string.find(arg1, "EUF_OptionFrame(.+)");

    if (optionId == "CONFIRM") then
        EUF_OptionFrame:Hide();
    elseif (optionId == "DEFAULT") then
        EUF_OptionsDefault_Load();
        if EUF_Frame_Update then
            EUF_Frame_Update();
        end;
    end;
end

;

local f = nil
function EUF_Options_DisablePartyFrame()
    HIDE_PARTY_INTERFACE = "1"
    hooksecurefunc("ShowPartyFrame", function()
        if (not InCombatLockdown()) then
            for i = 1, 4 do
                getglobal("PartyMemberFrame" .. i):Hide()
            end
        end
    end)
    for num = 1, 4 do
        f = getglobal("PartyMemberFrame" .. num)
        f:Hide()
        f:UnregisterAllEvents()
        getglobal("PartyMemberFrame" .. num .. "HealthBar"):UnregisterAllEvents()
        getglobal("PartyMemberFrame" .. num .. "ManaBar"):UnregisterAllEvents()
    end
end

function EUF_Options_EnablePartyFrame()
    HIDE_PARTY_INTERFACE = "0"
    hooksecurefunc("ShowPartyFrame", function()
        if (not InCombatLockdown()) then
            for i = 1, 4 do
                getglobal("PartyMemberFrame" .. i):Show()
            end
        end
    end)
    for num = 1, 4 do
        f = getglobal("PartyMemberFrame" .. num)
        if GetPartyMember(num) then
            f:Show()
        end
        f:RegisterAllEvents()
        getglobal("PartyMemberFrame" .. num .. "HealthBar"):RegisterAllEvents()
        getglobal("PartyMemberFrame" .. num .. "ManaBar"):RegisterAllEvents()
    end
end