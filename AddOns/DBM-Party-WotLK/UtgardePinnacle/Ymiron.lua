local mod = DBM:NewMod("Ymiron", "DBM-Party-WotLK", 11)
local L = mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 559 $"):sub(12, -3))
mod:SetCreatureID(26861)
mod:SetZone()

mod:RegisterCombat("combat")

mod:RegisterEvents(
	"SPELL_AURA_APPLIED"
)

local warningBane	= mod:NewAnnounce("WarningBane", 3, 48294)

function mod:APELL_AURA_APPLIED(args)
	if args.spellId == 48294 then
		warningBane:Show(args.spellName)
	end
end