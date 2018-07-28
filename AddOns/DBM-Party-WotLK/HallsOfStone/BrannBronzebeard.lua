local mod = DBM:NewMod("BrannBronzebeard", "DBM-Party-WotLK", 7)
local L = mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 4282 $"):sub(12, -3))
mod:SetCreatureID(28070)
--mod:SetZone()
mod:SetMinSyncRevision(2861)

mod:RegisterCombat("yell", L.Pull, L.enUS.Pull)
mod:RegisterKill("yell", L.Kill, L.enUS.Kill)
mod:SetMinCombatTime(50)
mod:SetWipeTime(25)

mod:RegisterEvents("CHAT_MSG_MONSTER_YELL")

local warningPhase = mod:NewAnnounce("WarningPhase", 2, "Interface\\Icons\\Spell_Nature_WispSplode")
local timerEvent = mod:NewTimer(302, "timerEvent", "Interface\\Icons\\Spell_Holy_BorrowedTime")

function mod:OnCombatStart(delay)
    timerEvent:Start(-delay)
end

function mod:CHAT_MSG_MONSTER_YELL(msg, sender)
    if DBM.isStr(msg, L.Phase1, L.enUS.Phase1) then
    --if L.Phase1 == msg then
        warningPhase:Show(1)
    elseif DBM.isStr(msg, L.Phase2, L.enUS.Phase2) then
    --elseif msg == L.Phase2 then
        warningPhase:Show(2)
    elseif DBM.isStr(msg, L.Phase3, L.enUS.Phase3) then
    --elseif msg == L.Phase3 then
        warningPhase:Show(3)
    end
end


