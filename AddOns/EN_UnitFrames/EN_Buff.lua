--[[
Enigma Unit Frames 3.0.3f (曉漁修改版)
2008.12.30
Changelog:
2009.04.30 Upgrade to 3.1.1 by 誰機@鬼霧峰TW
2010.10.26 Upgrade to 4.0.1 by 誰機@鬼霧峰TW
]]
local buff
local button;
local name, rank, icon, count, debuffType, duration, expirationTime;

function PartyBuff_Toggle()
    -- Party Buffs/Debuffs --
    for i = 1, 4 do
        local str = "PartyMemberFrame"..i;

        -- buff
        for j = 1, 16 do
            buff = CreateFrame("Button", str.."Buff"..j, getglobal(str), "TargetBuffFrameTemplate");
            buff:SetID(j);
            buff:SetWidth(15);
            buff:SetHeight(15);
            buff:SetScript("OnEnter",function(self)
                GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT", 15, -25);
                GameTooltip:SetUnitBuff("party"..i, j);
            end);
        
            buff:SetScript("OnUpdate",function()
                _, _, icon = UnitBuff("party"..i, j);
                getglobal(str.."Buff"..j.."Icon"):SetTexture(icon);
            end);

            buff:SetScript("OnLeave",function()
                GameTooltip:Hide();
            end);

            if j == 1 then
                Place(buff, "TOPLEFT", str, "TOPLEFT", 47+EUF_CurrentOptions["PARTYBUFFPOSITIONX"], -32+EUF_CurrentOptions["PARTYBUFFPOSITIONY"]);
            else
                Place(buff, "LEFT", str.."Buff"..j-1, "RIGHT", 2, 0);
            end;
        end;

        -- debuff
        local debuffbutton1 = getglobal(str.."Debuff1");
        debuffbutton1:ClearAllPoints();
        Place(debuffbutton1, "TOPLEFT", str, "RIGHT", 20+EUF_CurrentOptions["PARTYDEBUFFPOSITIONX"], 33+EUF_CurrentOptions["PARTYDEBUFFPOSITIONY"]);

        for j = 5, 10 do
            buff = CreateFrame("Button", str.."Debuff"..j, getglobal(str), "PartyBuffFrameTemplate");
            Place(buff, "LEFT", str.."Debuff"..j-1, "RIGHT", 2, 0);
        end;
    end;

    PartyBuff_UpdateAll();
end

function PartyBuffPositionUpdate()
    for i = 1, 4 do
        Place(_G["PartyMemberFrame"..i.."Buff1"], "TOPLEFT", "PartyMemberFrame"..i, "TOPLEFT", 47+EUF_CurrentOptions["PARTYBUFFPOSITIONX"], -32+EUF_CurrentOptions["PARTYBUFFPOSITIONY"]);
    end;
end

function PartyDebuffPositionUpdate()
    for i = 1, 4 do
        Place(_G["PartyMemberFrame"..i.."Debuff1"], "TOPLEFT", "PartyMemberFrame"..i, "RIGHT", 20+EUF_CurrentOptions["PARTYDEBUFFPOSITIONX"], 33+EUF_CurrentOptions["PARTYDEBUFFPOSITIONY"]);
    end;
end

function PartyBuff_UpdateAll()
    local EUF_LOCK = InCombatLockdown();
    local i, P_Num;
    P_Num = GetNumPartyMembers();
    for i = 1, P_Num do
        if(EUF_LOCK == 1) then
            _G["PartyMemberFrame"..i]:RegisterEvent("PLAYER_REGEN_ENABLED")
        else
            _G["PartyMemberFrame"..i]:UnregisterEvent("PLAYER_REGEN_ENABLED");
            local str = "PartyMemberFrame"..i;
            -- buff
            for j = 1, 16 do
                if EUF_CurrentOptions["PARTYBUFF"] == 1 then
                    _G[str.."Buff"..j]:Show();
                else
                    _G[str.."Buff"..j]:Hide();
                end;
            end;
        -- debuff
            for j = 5, 10 do
                if EUF_CurrentOptions["PARTYBUFF"] == 1 then
                    _G[str.."Debuff"..j]:Show();
                else
                    _G[str.."Debuff"..j]:Hide();
                end;
            end;
        end;
    end;
end

-- Pet Buffs/Debuffs --
for i = 1, 10 do
    buff = CreateFrame("Button", "PetFrameBuff"..i, PetFrame, "TargetBuffFrameTemplate");
    buff:SetID(i);
    buff:SetWidth(15);
    buff:SetHeight(15);
    buff:SetScript("OnEnter",function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
        GameTooltip:SetUnitBuff("pet", i);
    end);

    buff:SetScript("OnUpdate",function()
        _, _, icon = UnitBuff("pet", i);
        getglobal("PetFrameBuff"..i.."Icon"):SetTexture(icon);
    end);

    buff:SetScript("OnLeave",function()
        GameTooltip:Hide();
    end);

    if i == 1 then
        Place(buff, "TOPLEFT", PetFrame, "TOPLEFT", 48, -42);
    else
        Place(buff, "LEFT", "PetFrameBuff"..i-1, "RIGHT", 2, 0);
    end;

    buff = CreateFrame("Button", "PetFrameDebuff"..i, PetFrame, "PartyPetDeBuffFrameTemplate");
end;

function PartyMemberBuffTooltip_Update(isPet)
    -- none
end
