local mod = DBM:NewMod("Hodir", "DBM-Ulduar")
local L = mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 1162 $"):sub(12, -3))
mod:SetCreatureID(32845)
mod:SetZone()

mod:RegisterCombat("combat")
mod:RegisterKill("yell", L.YellKill)

mod:RegisterEvents(
	"SPELL_AURA_APPLIED",
	"SPELL_AURA_APPLIED_DOSE",
	"SPELL_CAST_START",
	"SPELL_CAST_SUCCESS"
)

mod:AddBoolOption("PlaySoundOnFlashFreeze", true, "announce")

local timerFlashFreeze		= mod:NewCastTimer(9, 61968)
local timerFrozenBlows		= mod:NewBuffActiveTimer(20, 63512)
local timerFlashFrCD		= mod:NewCDTimer(50, 61968)

local warnStormCloud		= mod:NewAnnounce("WarningStormCloud")
local warnFlashFreeze		= mod:NewSpecialWarning("WarningFlashFreeze")

local enrageTimer		= mod:NewEnrageTimer(475)

local timerAchieve		= mod:NewAchievementTimer(179, 3182, "TimerSpeedKill")

mod:AddBoolOption("YellOnStormCloud", true, "announce")
mod:AddBoolOption("SetIconOnStormCloud")

function mod:OnCombatStart(delay)
	enrageTimer:Start(-delay)
	timerAchieve:Start()
	timerFlashFrCD:Start(-delay)
end

function mod:SPELL_CAST_START(args)
	if args.spellId == 61968 then
		timerFlashFreeze:Start()
		warnFlashFreeze:Show()
		timerFlashFrCD:Start()
		if self.Options.PlaySoundOnFlashFreeze then
			PlaySoundFile("Sound\\Creature\\HoodWolf\\HoodWolfTransformPlayer01.wav")
		end
	end
end

function mod:SPELL_AURA_APPLIED(args)
	if args.spellId == 62478 or args.spellId == 63512 then
		timerFrozenBlows:Start()
	elseif args.spellId == 65123 or args.spellId == 65133 then
		warnStormCloud:Show(args.destName)
		if self.Options.YellOnStormCloud and args.destName == UnitName("player") then
			SendChatMessage(L.YellCloud, "YELL")
		end
		if self.Options.SetIconOnStormCloud then 
			mod:SetIcon(args.destName, 8, 6)
		end
	end
end


