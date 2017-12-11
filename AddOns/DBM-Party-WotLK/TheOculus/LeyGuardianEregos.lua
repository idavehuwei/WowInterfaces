local mod = DBM:NewMod("LeyGuardianEregos", "DBM-Party-WotLK", 9)
local L = mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 598 $"):sub(12, -3))
mod:SetCreatureID(27656)
mod:SetZone()

mod:RegisterCombat("combat")

mod:RegisterEvents(
	"SPELL_AURA_APPLIED"
)

local warningShift	= mod:NewAnnounce("WarningShift", 1, 51162)
local warningShiftEnd	= mod:NewAnnounce("WarningShiftEnd", 1, 51162)
local warningEnraged	= mod:NewAnnounce("WarningEnraged", 3, 51170)
local timerEnraged	= mod:NewTimer(12, "TimerEnrage", 51170)
local timerShift	= mod:NewTimer(18, "TimerShift", 51162)


function mod:SPELL_AURA_APPLIED(args)
	if args.spellId == 51162 then
		warningShift:Show(args.spellName)
		warningShiftEnd:Schedule(13)
		timerShift:Start(args.spellName)
	elseif args.spellId == 51170 then
		warningEnraged:Show(args.spellName)
		timerEnraged:Start(args.spellName)
	end
end