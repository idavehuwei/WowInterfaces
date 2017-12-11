local mod = DBM:NewMod("MalGanis", "DBM-Party-WotLK", 3)
local L = mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 636 $"):sub(12, -3))
mod:SetCreatureID(26533)
mod:SetZone()

mod:RegisterCombat("combat")

mod:RegisterEvents(
	"SPELL_AURA_APPLIED",
	"SPELL_AURA_REMOVED"
)

local warningSleep	= mod:NewAnnounce("WarningSleep", 2, 52721)
local timerSleep	= mod:NewTimer(10, "TimerSleep", 52721)
local timerSleepCD	= mod:NewTimer(20, "TimerSleepCD", 52721)

function mod:SPELL_AURA_APPLIED(args)
	if args.spellId == 52721 or args.spellId == 58849 then
		warningSleep:Show(args.spellName, args.destName)
		timerSleep:Start(args.spellName, args.destName)
		timerSleepCD:Start(args.spellName)
	end
end

function mod:SPELL_AURA_REMOVED(args)
	if args.spellId == 52721 or args.spellId == 58849 then
		timerSleep:Cancel()
	end
end