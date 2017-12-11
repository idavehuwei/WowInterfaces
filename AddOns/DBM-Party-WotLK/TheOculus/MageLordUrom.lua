local mod = DBM:NewMod("MageLordUrom", "DBM-Party-WotLK", 9)
local L = mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 669 $"):sub(12, -3))
mod:SetCreatureID(27655)
mod:SetZone()

mod:RegisterCombat("combat")

mod:RegisterEvents(
	"SPELL_AURA_APPLIED",
	"SPELL_CAST_START"
)

local warningTimeBomb		= mod:NewAnnounce("WarningTimeBomb", 2, 51121)
local warningExplosion		= mod:NewAnnounce("WarningExplosion", 3, 51110)
local timerTimeBomb		= mod:NewTimer(6, "TimerTimeBomb", 51121)
local timerExplosion		= mod:NewTimer(8, "TimerExplosion", 51110)
local specWarnBombYou		= mod:NewSpecialWarning("SpecWarnBombYou")

function mod:SPELL_CAST_START(args)
	if args.spellId == 51110 or args.spellId == 59377 then
		warningExplosion:Show(args.spellName)
		timerExplosion:Start(args.spellName)
		if args.destName == UnitName("player") then
			specWarnBombYou:Show()
		end
	end
end

function mod:SPELL_AURA_APPLIED(args)
	if args.spellId == 51121 or args.spellId == 59376 then
		warningTimeBomb:Show(args.spellName, args.destName)
		timerTimeBomb:Start(args.spellName, args.destName)
	end
end
