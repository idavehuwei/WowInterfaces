local mod = DBM:NewMod("Ichoron", "DBM-Party-WotLK", 12)
local L = mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 248 $"):sub(12, -3))
mod:SetCreatureID(29313)
mod:SetZone()

mod:RegisterCombat("combat")

mod:RegisterEvents(
)
