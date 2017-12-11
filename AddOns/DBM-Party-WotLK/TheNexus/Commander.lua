local mod = DBM:NewMod("Commander", "DBM-Party-WotLK", 8)
local L = mod:GetLocalizedStrings()
local faction = UnitFactionGroup("player")
local CreatureID = 26796
if faction == "Alliance" then
	CreatureID = 26798
end

mod:SetRevision(("$Revision: 437 $"):sub(12, -3))
mod:SetCreatureID(CreatureID)
mod:SetZone()

mod:RegisterCombat("combat")

mod:RegisterEvents(
	"SPELL_CAST_SUCCESS",
	"SPELL_CAST_START"
)

local warningFear	= mod:NewAnnounce("WarningFear", 3, 19134)
local warningWhirlwind	= mod:NewAnnounce("WarningWhirlwind", 3, 38619)
local timerFearCD	= mod:NewTimer(20, "TimerFearCD", 19134)
local timerWhirlwindCD	= mod:NewTimer(15, "TimerWhirlwindCD", 38619)


function mod:SPELL_CAST_SUCCESS(args)
	if args.spellId == 19134 
	and (args.sourceGUID == 26796 or args.sourceGUID == 26798) then
		warningFear:Show(args.spellName)
		timerFearCD:Start(args.spellName)
	end
end

function mod:SPELL_CAST_START(args)
	if (args.spellId == 38619 or args.spellId == 38618)
	and (args.sourceGUID == 26796 or args.sourceGUID == 26798) then
		warningWhirlwind:Show(args.spellName)
		timerWhirlwindCD:Start(args.spellName)
	end
end