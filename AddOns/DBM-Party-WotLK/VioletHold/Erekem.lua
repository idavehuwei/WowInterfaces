local mod = DBM:NewMod("Erekem", "DBM-Party-WotLK", 12)
local L = mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 559 $"):sub(12, -3))
mod:SetCreatureID(29315)
mod:SetZone()

mod:RegisterCombat("combat")

mod:RegisterEvents(
	"SPELL_AURA_APPLIED"
)

local warningES	= mod:NewAnnounce("WarningES", 3, 54479)

function mod:SPELL_AURA_APPLIED(args)
	if (args.spellId == 54479 or args.spellId == 59471)
	and args.sourceGUID == 29315 then
		warningES:Show(args.spellName)
	end
end