local mod = DBM:NewMod("ProphetTharonja", "DBM-Party-WotLK", 4)
local L = mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 559 $"):sub(12, -3))
mod:SetCreatureID(26632)
mod:SetZone()

mod:RegisterCombat("combat")

mod:RegisterEvents(
	"SPELL_CAST_SUCCESS"
)

local warningCloud = mod:NewAnnounce("WarningCloud", 3, 49548)

function mod:SPELL_CAST_SUCCESS(args)
	if args.spellId == 49548 or args.spellId == 59969 then
		warningCloud:Show(args.spellName)
	end
end