
UserDefaultSettings = LibStub('AceAddon-3.0'):NewAddon('UserDefaultSettings', 'AceEvent-3.0', 'AceHook-3.0', 'AceConsole-3.0')
local UserDefaultSettings = _G.UserDefaultSettings
local L = LibStub("AceLocale-3.0"):GetLocale("UserDefaultSettings")

local MODNAMESTRING = L["User Default Settings"]

local AceConfig =   LibStub("AceConfig-3.0")
local AceConfigReg  =   LibStub("AceConfigRegistry-3.0")
local AceConfigDialog   =   LibStub("AceConfigDialog-3.0")

local defaults = {
    profile = {
        usescale = true,
        uiscale = 0.68,
        chatframe = {
            ["point"] = "BOTTOMLEFT",
            ["relativepoint"] = "BOTTOMLEFT",
            ["ofx"] = 35,
            ["ofy"] = 100,
            ["w"] = 450,
            ["h"] = 220,
        },
        actionbar = {
            ["bottoml"] = true,
            ["bottomr"] = true,
            ["right1"] = true,
            ["right2"] = true,
            ["always"] = true,
        },
        minimapzoom = 0,
    }
}

local OptionsTable = {
    type    =   'group',
    name    =   MODNAMESTRING,
    args    =   {
        general =   {
            type    =   'group',
            order   =   1,
            name    =   L["General Options"],
            desc    =   L["General Options"],
            args    =   {
                Spacher1    =   {
                    type    =   'header',
                    order   =   1,
                    name    =   L["UI Scale Settings"],
                },
                EnableUiScale    =   {
                    type    =   'toggle',
                    order   =   2,
                    name    =   L["Enable UI Scale Settings"],
                    desc    =   L["Enable UI Scale Settings"],
                    get =   function(info)
                                return UserDefaultSettings.db.profile.usescale
                            end,
                    set =   function(info, newval)
                                UserDefaultSettings.db.profile.usescale = newval
                                UserDefaultSettings:UpdateUiScale()
                            end,
                },
                UiScale   =   {
                    type    =   'range',
                    order   =   3,
                    name    =   L["UI Scale"],
                    desc    =   L["Set UI Scale"],
                    get =   function(info)
                                return UserDefaultSettings.db.profile.uiscale
                            end,
                    set =   function(info, newval)
                                UserDefaultSettings.db.profile.uiscale = newval
                                UserDefaultSettings:UpdateUiScale()
                            end,
                    min =   0,
                    max =   1.5,
                    step    =   0.01,
                },
                -- Spacher2    =   {
                --     type    =   'header',
                --     order   =   4,
                --     name    =   L["Chat Frame Settings"],
                -- },
            },
        },
    },
}

OptionsFrames = {}

local COMBATLOG_EVENT_LIST = {
    ["ENVIRONMENTAL_DAMAGE"] = true,
    ["SWING_DAMAGE"] = true,
    ["SWING_MISSED"] = true,
    ["RANGE_DAMAGE"] = true,
    ["RANGE_MISSED"] = true,
    ["SPELL_CAST_START"] = false,
    ["SPELL_CAST_SUCCESS"] = false,
    ["SPELL_CAST_FAILED"] = false,
    ["SPELL_MISSED"] = true,
    ["SPELL_DAMAGE"] = true,
    ["SPELL_HEAL"] = true,
    ["SPELL_ENERGIZE"] = true,
    ["SPELL_DRAIN"] = true,
    ["SPELL_LEECH"] = true,
    ["SPELL_SUMMON"] = true,
    ["SPELL_RESURRECT"] = true,
    ["SPELL_CREATE"] = true,
    ["SPELL_INSTAKILL"] = true,
    ["SPELL_INTERRUPT"] = true,
    ["SPELL_EXTRA_ATTACKS"] = true,
    ["SPELL_DURABILITY_DAMAGE"] = false,
    ["SPELL_DURABILITY_DAMAGE_ALL"] = false,
    ["SPELL_AURA_APPLIED"] = false,
    ["SPELL_AURA_APPLIED_DOSE"] = false,
    ["SPELL_AURA_REMOVED"] = false,
    ["SPELL_AURA_REMOVED_DOSE"] = false,
    ["SPELL_AURA_BROKEN"] = false,
    ["SPELL_AURA_BROKEN_SPELL"] = false,
    ["SPELL_AURA_REFRESH"] = false,
    ["SPELL_DISPEL"] = true,
    ["SPELL_STOLEN"] = true,
    ["ENCHANT_APPLIED"] = true,
    ["ENCHANT_REMOVED"] = true,
    ["SPELL_PERIODIC_MISSED"] = true,
    ["SPELL_PERIODIC_DAMAGE"] = true,
    ["SPELL_PERIODIC_HEAL"] = true,
    ["SPELL_PERIODIC_ENERGIZE"] = true,
    ["SPELL_PERIODIC_DRAIN"] = true,
    ["SPELL_PERIODIC_LEECH"] = true,
    ["SPELL_DISPEL_FAILED"] = true,
    ["DAMAGE_SHIELD"] = false,
    ["DAMAGE_SHIELD_MISSED"] = false,
    ["DAMAGE_SPLIT"] = false,
    ["PARTY_KILL"] = true,
    ["UNIT_DIED"] = true,
    ["UNIT_DESTROYED"] = true,
    ["SPELL_BUILDING_DAMAGE"] = true,
    ["SPELL_BUILDING_HEAL"] = true,
};

function UserDefaultSettings:SetUIScale(enable, scale)
    if(GetCVar("useUiScale") ~= nil) then
        if(enable == true or enable == 1) then
            SetCVar("useUiScale", 1);
            if(GetCVar("uiScale") ~= nil) then
                SetCVar("uiScale", scale);
            end
        else
            SetCVar("useUiScale", 0);
        end
    end
end

function UserDefaultSettings:SetupChatFrame(cfg)
    if(cfg == nil) then return; end
    _G.ChatFrame1:ClearAllPoints();
    _G.ChatFrame1:SetPoint(cfg.point, UIParent, cfg.relativepoint, cfg.ofx, cfg.ofy);
    _G.ChatFrame1:SetWidth(cfg.w);
    _G.ChatFrame1:SetHeight(cfg.h);
end

function UserDefaultSettings:SetupActionBar(cfg)
    if(cfg == nil) then return; end
    local bl,br,r1,r2,always;
    if(cfg.bottoml == true or cfg.bottoml == 1) then bl = "1"; else bl = nil; end
    if(cfg.bottomr == true or cfg.bottomr == 1) then br = "1"; else br = nil;  end
    if(cfg.right1 == true or cfg.right1 == 1) then r1 = "1"; else r1 = nil;  end
    if(cfg.right2 == true or cfg.right2 == 1) then r2 = "1"; else r2 = nil;  end
    if(cfg.always == true or cfg.always == 1) then always = "1"; else always = nil;  end

    SetActionBarToggles(bl,br,r1,r2,always);
    MultiActionBar_Update();

    if(cfg.always == true or cfg.always == 1) then
        SetCVar("alwaysShowActionBars", "1");
    else
        SetCVar("alwaysShowActionBars", "0");
    end
end

function UserDefaultSettings:SetupMiniMapZoom(zoom)
    if(GetCVar("minimapZoom") ~= nil) then
        SetCVar("minimapZoom", zoom);
    end
end

function UserDefaultSettings:UpdateUiScale()
    local db = self.db.profile;
    self:SetUIScale(db.usescale, db.uiscale);
end

function UserDefaultSettings:ApplaySettings()
    local db = self.db.profile;
    self:SetUIScale(db.usescale, db.uiscale);
    self:SetupChatFrame(db.chatframe);
    self:SetupActionBar(db.actionbar);
    self:SetupMiniMapZoom(db.minimapzoom);
end

function UserDefaultSettings:HandleProfileChanges()
    --Settings:ApplaySettings()
end

function UserDefaultSettings:BlizzardSetupOptions()
    AceConfigReg:RegisterOptionsTable(MODNAMESTRING, OptionsTable , MODNAMESTRING)
    OptionsFrames.main    =   AceConfigDialog:AddToBlizOptions(MODNAMESTRING, nil, nil, "general")
end

function UserDefaultSettings:OnEnable(...)
end

function UserDefaultSettings:OnDisable()
end

function UserDefaultSettings:OnInitialize()
    local ACEDB = LibStub:GetLibrary("AceDB-3.0");
    UserDefaultSettings.db = ACEDB:New("UserDefaultSettingsDB", defaults);

    UserDefaultSettings:BlizzardSetupOptions();
    UserDefaultSettings:RegisterChatCommand("uds", function() InterfaceOptionsFrame_OpenToCategory(OptionsFrames["main"]) end)

    -- self.db.RegisterCallback(self, "OnNewProfile", "HandleProfileChanges");
    -- self.db.RegisterCallback(self, "OnProfileChanged", "HandleProfileChanges");
    -- self.db.RegisterCallback(self, "OnProfileCopied", "HandleProfileChanges");
    -- self.db.RegisterCallback(self, "OnProfileReset", "HandleProfileChanges");

    self:RegisterEvent("PLAYER_ENTERING_WORLD", "ApplaySettings", true);
end

local ProcEnterCombe = false
function UserDefaultSettings_OnLoad()
--    UserDefaultSettings:RegisterEvent("SPELL_CAST_START")
--    UserDefaultSettings:RegisterEvent("PLAYER_REGEN_DISABLED")
--    UserDefaultSettings:RegisterEvent("PLAYER_ENTER_COMBAT")
--
--    UserDefaultSettings:RegisterEvent("PLAYER_REGEN_ENABLED")
--    UserDefaultSettings:RegisterEvent("PLAYER_LEAVE_COMBAT")
end

function UserDefaultSettings_OnEvent(event, ...)
    print("UserDefaultSettings_OnEvent: "..tostring(event))
end

function UserDefaultSettings:SPELL_CAST_START()
    if (ProcEnterCombe == false) then
        print("SPELL_CAST_START")
        CombatLogClearEntries()
        ProcEnterCombe = true;
    end
end

function UserDefaultSettings:PLAYER_REGEN_DISABLED()
    if (ProcEnterCombe == false) then
        print("PLAYER_REGEN_DISABLED")
        CombatLogClearEntries()
        ProcEnterCombe = true;
    end
end

function UserDefaultSettings:PLAYER_ENTER_COMBAT()
    if (ProcEnterCombe == false) then
        print("PLAYER_ENTER_COMBAT")
        CombatLogClearEntries()
        ProcEnterCombe = true;
    end
end

function UserDefaultSettings:PLAYER_REGEN_ENABLED()
    ProcEnterCombe = false;
end

function UserDefaultSettings:PLAYER_LEAVE_COMBAT()
    ProcEnterCombe = false;
end

