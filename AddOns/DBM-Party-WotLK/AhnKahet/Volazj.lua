local mod = DBM:NewMod("Volazj", "DBM-Party-WotLK", 1)
local L = mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 559 $"):sub(12, -3))
mod:SetCreatureID(29311)
mod:SetZone()

mod:RegisterCombat("combat")

mod:RegisterEvents(
	"SPELL_CAST_START"
)

local warningInsanity	= mod:NewAnnounce("WarningInsanity", 3, 57496)

function mod:SPELL_CAST_START(args)
	if args.spellId == 57496 then
		warningInsanity:Show(args.spellName)
	end
end