function Party_Spellbar_OnLoad(self)
    self:RegisterEvent("PARTY_MEMBERS_CHANGED");
    self:RegisterEvent("PARTY_MEMBER_ENABLE");
    self:RegisterEvent("PARTY_MEMBER_DISABLE");
    self:RegisterEvent("PARTY_LEADER_CHANGED");
    self:RegisterEvent("CVAR_UPDATE");

    self:SetID(self:GetParent():GetID());
    self:SetFrameStrata("MEDIUM");
    RaiseFrameLevel(self);

    self.unit = "party"..self:GetID();
    CastingBarFrame_OnLoad(self, self.unit, false);

    local barIcon = getglobal(self:GetName().."Icon");
    barIcon:Show();

    SetPartySpellbarAspect(self);
end

function SetPartySpellbarAspect(self)
    local frameText = getglobal(self:GetName().."Text");

    if (frameText) then
        frameText:SetTextHeight(15);
        frameText:ClearAllPoints();
        Place(frameText, "TOP", self, "TOP", 0, 4);
    end;

    local frameBorder = getglobal(self:GetName().."Border");

    if (frameBorder) then
        frameBorder:SetTexture("Interface\\CastingBar\\UI-CastingBar-Border-Small");
        frameBorder:SetWidth(156);
        frameBorder:SetHeight(49);
        frameBorder:ClearAllPoints();
        Place(frameBorder, "TOP", self, "TOP", 0, 20);
    end;

    local frameFlash = getglobal(self:GetName().."Flash");

    if (frameFlash) then
        frameFlash:SetTexture("Interface\\CastingBar\\UI-CastingBar-Flash-Small");
        frameFlash:SetWidth(156);
        frameFlash:SetHeight(49);
        frameFlash:ClearAllPoints();
        Place(frameFlash, "TOP", self, "TOP", 0, 20);
    end;
end

function Party_Spellbar_OnShow(self, button)
    self:ClearAllPoints();

    if (UnitIsConnected(self.unit) and UnitExists("partypet"..self:GetID()) and SHOW_PARTY_PETS == "1") then
        Place(self, "BOTTOM", self:GetParent(), "BOTTOM", 8+EUF_CurrentOptions["PARTYCASTPOSITIONX"], -34+EUF_CurrentOptions["PARTYCASTPOSITIONY"]);
    else
        Place(self, "BOTTOM", self:GetParent(), "BOTTOM", 8+EUF_CurrentOptions["PARTYCASTPOSITIONX"], -8+EUF_CurrentOptions["PARTYCASTPOSITIONY"]);
    end;
end

function PartyCastPositionUpdate()
    for i = 1, 4 do
        if (UnitIsConnected(_G["PartyFrame"..i.."SpellBar"].unit) and UnitExists("partypet"..i) and SHOW_PARTY_PETS == "1") then
            Place(_G["PartyFrame"..i.."SpellBar"], "BOTTOM", "PartyMemberFrame"..i, "BOTTOM", 8+EUF_CurrentOptions["PARTYCASTPOSITIONX"], -34+EUF_CurrentOptions["PARTYCASTPOSITIONY"]);
        else
            Place(_G["PartyFrame"..i.."SpellBar"], "BOTTOM", "PartyMemberFrame"..i, "BOTTOM", 8+EUF_CurrentOptions["PARTYCASTPOSITIONX"], -8+EUF_CurrentOptions["PARTYCASTPOSITIONY"]);
        end;
    end;
end
function Party_Spellbar_OnEvent(self, event, ...)
    local newevent = event;
    local arg1, arg2, arg3 = ...;
    local newarg1 = arg1;

    if (event == "CVAR_UPDATE") then
        if (self.casting or self.channeling) then
            self:Show();
        else
            self:Hide();
        end;

        return;
    elseif (event == "PARTY_MEMBERS_CHANGED") or (event == "PARTY_MEMBER_ENABLE") or (event == "PARTY_MEMBER_DISABLE") or (event == "PARTY_LEADER_CHANGED") then
        -- check if the new target is casting a spell
        local nameChannel = UnitChannelInfo(self.unit);
        local nameSpell = UnitCastingInfo(self.unit);

        if (nameChannel) then
            newevent = "UNIT_SPELLCAST_CHANNEL_START";
            newarg1 = "party"..self:GetID();
        elseif (nameSpell) then
            newevent = "UNIT_SPELLCAST_START";
            newarg1 = "party"..self:GetID();
        else
            self.casting = nil;
            self.channeling = nil;
            self:SetMinMaxValues(0, 0);
            self:SetValue(0);
            self:Hide();

            return;
        end;
    end;

    PartyCast_Toggle(self, newevent, newarg1);
end

function PartyCast_Toggle(self, newevent, newarg1)
    if (EUF_CurrentOptions["PARTYCAST"]==1) then
        CastingBarFrame_OnEvent(self, newevent, newarg1);
    end;
end
