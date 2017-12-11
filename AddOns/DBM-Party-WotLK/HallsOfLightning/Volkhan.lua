local mod = DBM:NewMod("Volkhan", "DBM-Party-WotLK", 6)
local L = mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 559 $"):sub(12, -3))
mod:SetCreatureID(28587)
mod:SetZone()

mod:RegisterCombat("combat")

local warningStomp	= mod:NewAnnounce("WarningStomp", 3, 52237)
local timerStompCD	= mod:NewTimer(30, "TimerStompCD", 52237)

mod:RegisterEvents(
	"SPELL_CAST_START"
)

function mod:SPELL_CAST_START(args)
	if args.spellId == 59529 or args.spellId == 52237 then
		warningStomp:Show(args.spellName)
		timerStompCD:Start(args.spellName)
	end
end