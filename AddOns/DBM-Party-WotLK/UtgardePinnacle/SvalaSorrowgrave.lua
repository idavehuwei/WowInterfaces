local mod = DBM:NewMod("SvalaSorrowgrave", "DBM-Party-WotLK", 11)
local L = mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 636 $"):sub(12, -3))
mod:SetCreatureID(26668)
mod:SetZone()

mod:RegisterCombat("combat")

mod:RegisterEvents(
	"SPELL_CAST_START"
)

--local warningSword	= mod:NewAnnounce("WarningSword", 2, 48276) -- seems to be broken
local warningSword	= mod:NewAnnounce((GetSpellInfo(48276)), 2, 48276) -- temporary replacement...just a simple warnung with the spell's name is better than "Unknown: Unknown!"

function mod:SPELL_CAST_START(args)
	if args.spellId == 48276 then
--		warningSword:Show(args.spellName, args.destName) -- doesn't work?!
		warningSword:Show()
	end
end