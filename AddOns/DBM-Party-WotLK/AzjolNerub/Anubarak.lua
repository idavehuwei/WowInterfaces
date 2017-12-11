local mod = DBM:NewMod("Anubarak", "DBM-Party-WotLK", 2)
local L = mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 559 $"):sub(12, -3))
mod:SetCreatureID(29120)
mod:SetZone()

mod:RegisterCombat("combat")

mod:RegisterEvents(
	"SPELL_CAST_START"
)

local warningPound		= mod:NewAnnounce("WarningPound", 3, 53472)

function mod:SPELL_CAST_START(args)
	if args.spellId == 53472 or args.spellId == 59433 then
		warningPound:Show(args.spellName)
	end
end