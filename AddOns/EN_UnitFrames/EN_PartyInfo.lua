function EUF_PartyInfo_OnLoad(this)
    this:RegisterEvent("PLAYER_ENTERING_WORLD");
    this:RegisterEvent("UNIT_FACTION");
    this:RegisterEvent("UNIT_LEVEL");
    this:RegisterEvent("UNIT_HEALTH");
    this:RegisterEvent("UNIT_MANA");
    this:RegisterEvent("UNIT_RAGE");
    this:RegisterEvent("UNIT_ENERGY");
    this:RegisterEvent("UNIT_MAXHEALTH");
    this:RegisterEvent("UNIT_MAXMANA");
    this:RegisterEvent("UNIT_MAXRAGE");
    this:RegisterEvent("UNIT_MAXENERGY");
    this:RegisterEvent("UNIT_DISPLAYPOWER");
    this:RegisterEvent("PARTY_MEMBERS_CHANGED");
    this:RegisterEvent("PARTY_MEMBER_ENABLE");
    this:RegisterEvent("PARTY_MEMBER_DISABLE");
    this:RegisterEvent("PARTY_LEADER_CHANGED");
    this:RegisterEvent("RAID_ROSTER_UPDATE");
    this:RegisterEvent("VARIABLES_LOADED");
    this:RegisterEvent("WORLD_MAP_UPDATE");
    this:RegisterEvent("UPDATE_INSTANCE_INFO");
end

function EUF_PartyInfo_OnEvent(self, event, ...)
    if event == "VARIABLES_LOADED"
        or event == "WORLD_MAP_UPDATE"
        or event == "PLAYER_ENTERING_WORLD"
        or event == "PARTY_MEMBERS_CHANGED"
        or event == "PARTY_LEADER_CHANGED"
        or event == "RAID_ROSTER_UPDATE"
        or event == "UPDATE_INSTANCE_INFO"
        or event == "UNIT_LEVEL" then

        EUF_HidePartyToggle();
        EUF_FramePartyInfo_Update();
        EUF_PartyMember_CheckClass();
    end;
end

function EUF_PartyInfo_Update(unit)
    if not unit then
        return;
    end;

    local unitExists, _, unitId = string.find(unit, "^party(%d)$");

    if not unitExists then
        return;
    end;

    -- Set class
    if EUF_CurrentOptions["PARTYCLASS"] == 1 then
        local class = UnitClass(unit);

        if class then
            if EUF_CurrentOptions["PARTYCLASSABRV"] == 1 then
                class = string.sub(class, 1, 3);
            end;

            getglobal("EUF_PartyInfo" .. unitId .. "Class"):SetText(class);
        end;
    else
        getglobal("EUF_PartyInfo" .. unitId .. "Class"):SetText("");
    end;

    -- Set level
    if EUF_CurrentOptions["PARTYLEVEL"] == 1 then
        local level = UnitLevel(unit);

        if level then
            if level < 1 then
                level = "??";
            end;

            getglobal("EUF_PartyInfo" .. unitId .. "Level"):SetText(level);
        end;
    else
        getglobal("EUF_PartyInfo" .. unitId .. "Level"):SetText("");
    end;
end

function EUF_FramePartyInfo_Update()
    local i;

    for i = 1, GetNumPartyMembers(), 1 do
        EUF_PartyInfo_Update("party" .. i);
    end;
end

function EUF_PartyMember_CheckClass()
    local n = GetNumPartyMembers();

    if n > 0 then
        for i = 1, n do
            local _, enClass = UnitClass("party" .. i);

            if EUF_CurrentOptions["PARTYCOLOR"] == 1 and enClass then
                getglobal("PartyMemberFrame" .. i .. "Name"):SetTextColor(RAID_CLASS_COLORS[enClass].r, RAID_CLASS_COLORS[enClass].g, RAID_CLASS_COLORS[enClass].b);
            else
                getglobal("PartyMemberFrame" .. i .. "Name"):SetTextColor(1, 0.8, 0);
            end;
        end;
    end;
end

function EUF_Options_DisablePartyFrame()
    local EUF_LOCK = InCombatLockdown();
    local i;
    for i = 1, 4 do
        if (EUF_LOCK == 1) then
            _G["PartyMemberFrame" .. i]:RegisterEvent("PLAYER_REGEN_ENABLED")
        else
            _G["PartyMemberFrame" .. i]:UnregisterEvent("PLAYER_REGEN_ENABLED");
            HIDE_PARTY_INTERFACE = "1";
            HidePartyFrame();
            _G["PartyMemberFrame" .. i]:UnregisterAllEvents();
            _G["PartyMemberFrame" .. i .. "HealthBar"]:UnregisterAllEvents();
            _G["PartyMemberFrame" .. i .. "ManaBar"]:UnregisterAllEvents();
        end;
    end;
end

;
function EUF_Options_EnablePartyFrame()
    local EUF_LOCK = InCombatLockdown();
    local i;
    for i = 1, 4 do
        if (EUF_LOCK == 1) then
            _G["PartyMemberFrame" .. i]:RegisterEvent("PLAYER_REGEN_ENABLED")
        else
            HIDE_PARTY_INTERFACE = "0";
            _G["PartyMemberFrame" .. i]:RegisterAllEvents();
            _G["PartyMemberFrame" .. i .. "HealthBar"]:RegisterAllEvents();
            _G["PartyMemberFrame" .. i .. "ManaBar"]:RegisterAllEvents();
            _G["PartyMemberFrame" .. i]:UnregisterEvent("PLAYER_REGEN_ENABLED");
            if (not UnitInRaid("player")) then
                ShowPartyFrame();
            end;
        end;
    end;
end

;
function EUF_HidePartyToggle()
    if EUF_CurrentOptions["PARTYHIDE"] == 1 then
        EUF_Options_DisablePartyFrame();
    else
        EUF_Options_EnablePartyFrame();
    end;
end

;
