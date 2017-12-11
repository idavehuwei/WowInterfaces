local mod = DBM:NewMod("Ionar", "DBM-Party-WotLK", 6)
local L = mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 559 $"):sub(12, -3))
mod:SetCreatureID(28546)
mod:SetZone()

mod:RegisterCombat("combat")

local warningOverload	= mod:NewAnnounce("WarningOverload", 2, 52658)
local warningSplit	= mod:NewAnnounce("WarningSplit", 3, 52770)
local timerOverload	= mod:NewTimer(10, "TimerOverload", 52657)

mod:RegisterEvents(
	"SPELL_AURA_APPLIED",
	"SPELL_CAST_START"
)

function mod:SPELL_AURA_APPLIED(args)
	if args.spellId == 52657 or args.spellId == 59795 then
		warningOverload:Show(args.spellName, args.destName)
		timerOverload:Start(args.spellName, args.destName)
	end
end

function mod:SPELL_CAST_START(args)
	if args.spellId == 52770 then
		warningSplit:Show(args.spellName)
	end
end