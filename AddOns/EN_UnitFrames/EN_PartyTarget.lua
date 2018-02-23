function PartyTarget_OnUpdate(self, elapsed)
    self.timer = (self.timer or 0) + elapsed;

    if self.timer >= 0.2 then
        local i = self:GetID();
        local unit = "party" .. i .."target";
        local uframe = "PartyTarget"..i;

        if UnitExists(unit) and EUF_CurrentOptions["PARTYTARGET"]==1 then
            if GetNumFrames(getglobal(uframe)) then
                _, en = UnitClass(unit);
                color = RAID_CLASS_COLORS[en] or NORMAL_FONT_COLOR;
                perc = floor( (UnitHealth(unit) or 0) / max((UnitHealthMax(unit) or 1),1) * 100 );

                getglobal(uframe):SetAlpha(1);
                getglobal(uframe.."Name"):SetText(UnitName(unit));
                getglobal(uframe.."Name"):SetTextColor(color.r, color.g, color.b);
                getglobal(uframe.."HealthBar"):SetValue(perc);
                getglobal(uframe.."HealthBarText"):SetText(perc .. "%");

                if perc == 0 then
                    getglobal(uframe.."HealthBarText"):SetText("|cffeed200DEAD|r");
                end;

                if UnitIsEnemy("player", unit) then
                    getglobal(uframe.."Border"):SetVertexColor(1, 0.2, 0.2);
                    getglobal(uframe.."HealthBar"):SetStatusBarColor(1, 0.55, 0.72);
                elseif UnitIsFriend("player", unit) then
                    getglobal(uframe.."Border"):SetVertexColor(0, 1, 0);
                    getglobal(uframe.."HealthBar"):SetStatusBarColor(0, 1, 0);
                else
                    getglobal(uframe.."Border"):SetVertexColor(0.9, 0.82, 0);
                    getglobal(uframe.."HealthBar"):SetStatusBarColor(0.65, 0.9, 0.85);
                end;
            else
                getglobal(uframe):SetAlpha(0);
            end;
        else
            getglobal(uframe):SetAlpha(0);
        end;

        self.timer = 0;
    end;
end

function PartyTarget_Toggle()
    local frame;
    for i = 1, 4 do
        frame = CreateFrame("Button", "PartyTarget"..i, _G["PartyMemberFrame"..i], "PartyTargetFrameTemplate");
        frame = _G["PartyTarget"..i];

        Place(frame, "TOPLEFT", _G["PartyMemberFrame"..i], "TOPLEFT", 200+EUF_CurrentOptions["PARTYTARGETPOSITIONX"], -6+EUF_CurrentOptions["PARTYTARGETPOSITIONY"]);

        frame:SetAttribute("unit", "party"..i.."target");
        frame:SetAttribute("*type1", "target");
        frame:SetAlpha(0);
    end;
    hooksecurefunc("PartyMemberFrame_OnUpdate", function(self, elapsed)
        PartyTarget_OnUpdate(self, elapsed);
    end);
end

function PartyTargetPositionUpdate()
    for i = 1, 4 do
        Place(_G["PartyTarget"..i], "TOPLEFT", "PartyMemberFrame"..i, "TOPLEFT", 200+EUF_CurrentOptions["PARTYTARGETPOSITIONX"], -6+EUF_CurrentOptions["PARTYTARGETPOSITIONY"]);
    end;
end

function PartyTarget_UpdateAll()
    for i = 1, 4 do
        local unit = "party" .. i .."target";
        local uframe = "PartyTarget"..i;

        if UnitExists(unit) and EUF_CurrentOptions["PARTYTARGET"] == 1 then
            _G[uframe]:SetAlpha(1);
        else
            _G[uframe]:SetAlpha(0);
        end;
    end;
end
