local mod = DBM:NewMod("VarosCloudstrider", "DBM-Party-WotLK", 9)
local L = mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 598 $"):sub(12, -3))
mod:SetCreatureID(27447)
mod:SetZone()

mod:RegisterCombat("combat")

mod:RegisterEvents(
	"SPELL_AURA_APPLIED",
	"SPELL_AURA_REMOVED"
)

local warningAmplify = mod:NewAnnounce("WarningAmplify", 2, 51054)

function mod:SPELL_AURA_APPLIED(args)
	if args.spellId == 51054 or args.spellId == 59371 then
		warningAmplify:Show(args.spellName, args.destName)
	end
end

function mod:SPELL_AURA_REMOVED(args)
	if args.spellId == 51054 or args.spellId == 59371 then
		warningAmplify:Cancel(args.spellName, args.destName)
	end
end