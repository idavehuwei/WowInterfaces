local mod = DBM:NewMod("NovosTheSummoner", "DBM-Party-WotLK", 4)
local L = mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 3635 $"):sub(12, -3))
mod:SetCreatureID(26631)
mod:SetZone()

mod:RegisterCombat("yell", L.YellPull)
mod:RegisterCombat("yell", L.enUS.YellPull)
mod:RegisterKill("yell", L.YellKill)
mod:RegisterKill("yell", L.enUS.YellKill)
mod:SetWipeTime(25)

mod:RegisterEvents("CHAT_MSG_MONSTER_YELL")

local WarnCrystalHandler = mod:NewAnnounce("WarnCrystalHandler")
local warnPhase2 = mod:NewPhaseAnnounce(2)

local timerCrystalHandler = mod:NewTimer(20, "timerCrystalHandler")

local CrystalHandlers = 4

function mod:OnCombatStart(delay)
    timerCrystalHandler:Start(25.5 - delay)
    CrystalHandlers = 4
end

function mod:CHAT_MSG_MONSTER_YELL(msg)
    if DBM.isStr(msg, L.HandlerYell, L.enUS.HandlerYell) then
    --if msg == L.HandlerYell then
        CrystalHandlers = CrystalHandlers - 1
        if CrystalHandlers > 0 then
            WarnCrystalHandler:Show(CrystalHandlers)
            timerCrystalHandler:Start()
        else
            WarnCrystalHandler:Show(CrystalHandlers)
        end
    elseif DBM.isStr(msg, L.Phase2, L.enUS.Phase2) then
    --elseif msg == L.Phase2 then
        warnPhase2:Show()
    end
end
